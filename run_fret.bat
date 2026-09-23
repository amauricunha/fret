@echo off
title NASA FRET (WSL2)
echo ========================================================
echo   Iniciando NASA FRET via WSL2 (Ubuntu-24.04)
echo ========================================================
echo A interface grafica esta sendo inicializada...
echo (Mantenha esta janela aberta enquanto utiliza o FRET)
echo.
wsl.exe -d Ubuntu-24.04 bash -lic "/mnt/c/workspace/fret/run_fret_wsl.sh"
echo.
echo O NASA FRET foi finalizado.
pause
