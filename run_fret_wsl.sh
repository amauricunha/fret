#!/usr/bin/env bash
# NASA FRET WSL2 Launcher

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm use 20 > /dev/null 2>&1 || true

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="$PATH:$SCRIPT_DIR/tools/LTLSIM/ltlsim-core/simulator"

mkdir -p "$HOME/Documents"

echo "Iniciando o NASA FRET no WSL2..."
cd "$SCRIPT_DIR/fret-electron"
./node_modules/.bin/electron --no-sandbox ./app/ "$@"
