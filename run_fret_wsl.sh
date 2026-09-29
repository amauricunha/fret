#!/usr/bin/env bash
# NASA FRET WSL2 Launcher

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm use 20 > /dev/null 2>&1 || true

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="$PATH:$SCRIPT_DIR/tools/LTLSIM/ltlsim-core/simulator"

export DISPLAY="${DISPLAY:-:0}"
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-0}"

if [ ! -e "/tmp/.X11-unix/X0" ] && [ ! -e "$XDG_RUNTIME_DIR/wayland-0" ] && [ ! -e "/mnt/wslg/runtime-dir/wayland-0" ]; then
    echo "================================================================="
    echo "AVISO: O subsistema grafico do WSLg nao esta ativo no momento."
    echo "Isso ocorre tipicamente apos o Windows suspender ou hibernar."
    echo ""
    echo "Solucao rapida: Feche esta janela, abra o PowerShell e rode:"
    echo "   wsl --shutdown"
    echo "Em seguida, abra o run_fret.bat novamente."
    echo "================================================================="
    exit 1
fi

mkdir -p "$HOME/Documents"

echo "Iniciando o NASA FRET no WSL2 (modo gráfico)..."
echo "Aguarde alguns segundos enquanto a janela é carregada na tela."
cd "$SCRIPT_DIR/fret-electron"
./node_modules/.bin/electron --no-sandbox --disable-gpu ./app/ "$@"
