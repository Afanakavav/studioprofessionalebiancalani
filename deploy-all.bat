@echo off
echo ========================================
echo Deploy Completo - Studio Biancalani
echo ========================================
echo.

echo Deploy Functions e Hosting insieme...
echo.

firebase deploy --only functions,hosting:studioprofessionalebiancalani

if %errorlevel% neq 0 (
    echo.
    echo ERRORE: Deploy fallito
    pause
    exit /b 1
)

echo.
echo ========================================
echo Deploy completato!
echo ========================================
echo.
echo ✅ Functions deployate
echo ✅ Hosting deployato su: https://studioprofessionalebiancalani.web.app
echo.
echo Il progetto apheron-homepage NON è stato modificato.
echo.
pause

