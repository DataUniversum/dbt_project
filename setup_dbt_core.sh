#!/usr/bin/env bash
# =============================================================================
# install_dbt.sh — dbt Core + Snowflake adapter setup (Linux / macOS)
# Place in the project repo root alongside requirements.txt
# Usage: bash install_dbt.sh
# =============================================================================

set -euo pipefail

VENV_DIR=".venv"
REQUIREMENTS="requirements.txt"

# Python version constraints
PY_MIN_MAJOR=3; PY_MIN_MINOR=10   # dbt-common 1.10+ requires Python 3.10+
PY_MAX_MAJOR=3; PY_MAX_MINOR=12   # 3.13 not yet validated for dbt-snowflake 1.11.x
PY_REC_MINOR=11                    # recommended

# ── helpers ──────────────────────────────────────────────────────────────────
info()  { printf '\033[1;34m[INFO]\033[0m  %s\n' "$*"; }
ok()    { printf '\033[1;32m[ OK ]\033[0m  %s\n' "$*"; }
warn()  { printf '\033[1;33m[WARN]\033[0m  %s\n' "$*"; }
die()   { printf '\033[1;31m[ERR ]\033[0m  %s\n' "$*" >&2; exit 1; }

# ── 1. Locate Python ─────────────────────────────────────────────────────────
info "Locating Python interpreter..."

# Prefer explicit minor versions in recommended order
PYTHON_BIN=""
for candidate in python3.11 python3.12 python3.10 python3 python; do
    if command -v "$candidate" &>/dev/null; then
        PYTHON_BIN=$(command -v "$candidate")
        break
    fi
done

[[ -n "$PYTHON_BIN" ]] || die "No Python interpreter found. Install Python 3.10–3.12 and retry."

# ── 2. Validate version ───────────────────────────────────────────────────────
PY_MAJOR=$("$PYTHON_BIN" -c "import sys; print(sys.version_info.major)")
PY_MINOR=$("$PYTHON_BIN" -c "import sys; print(sys.version_info.minor)")
PY_VER="${PY_MAJOR}.${PY_MINOR}"

if [[ "$PY_MAJOR" -lt "$PY_MIN_MAJOR" ]] || \
   { [[ "$PY_MAJOR" -eq "$PY_MIN_MAJOR" ]] && [[ "$PY_MINOR" -lt "$PY_MIN_MINOR" ]]; }; then
    die "Python ${PY_VER} is too old. dbt-core 1.11 requires Python ${PY_MIN_MAJOR}.${PY_MIN_MINOR}+."
fi

if [[ "$PY_MAJOR" -eq "$PY_MAX_MAJOR" ]] && [[ "$PY_MINOR" -gt "$PY_MAX_MINOR" ]]; then
    warn "Python ${PY_VER} detected. dbt-snowflake 1.11 is not yet validated on 3.13+."
    warn "Recommended: Python 3.${PY_REC_MINOR}. Proceeding anyway — check for pip errors."
else
    ok "Python ${PY_VER} (${PYTHON_BIN})"
fi

# ── 3. Create virtual environment ─────────────────────────────────────────────
if [[ -d "$VENV_DIR" ]]; then
    warn "Virtual environment '${VENV_DIR}' already exists — skipping creation."
    warn "To recreate: rm -rf ${VENV_DIR} && bash install_dbt.sh"
else
    info "Creating virtual environment in '${VENV_DIR}'..."
    "$PYTHON_BIN" -m venv "$VENV_DIR"
    ok "Virtual environment created."
fi

# ── 4. Activate venv ─────────────────────────────────────────────────────────
info "Activating virtual environment..."
# shellcheck disable=SC1091
source "${VENV_DIR}/bin/activate"
ok "Active: $(which python) ($(python --version))"

# ── 5. Upgrade pip ────────────────────────────────────────────────────────────
info "Upgrading pip..."
pip install --quiet --upgrade pip
ok "pip $(pip --version | awk '{print $2}')"

# ── 6. Install packages ───────────────────────────────────────────────────────
[[ -f "$REQUIREMENTS" ]] || die "'${REQUIREMENTS}' not found. Run from the project root."

info "Installing from ${REQUIREMENTS}..."
pip install -r "$REQUIREMENTS"
ok "Packages installed."

# ── 7. Verify dbt ─────────────────────────────────────────────────────────────
info "Verifying dbt..."
dbt --version

echo ""
echo "============================================================"
echo "  Setup complete!"
echo "  Activate your env: source ${VENV_DIR}/bin/activate"
echo "  Verify connection: dbt debug"
echo "============================================================"