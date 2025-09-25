@echo off
echo Criando ambiente virtual...
python -m venv venv
echo.
echo Ativando ambiente virtual...
call venv\Scripts\activate.bat
echo.
echo Instalando dependencias...
pip install --upgrade pip
pip install -r requirements.txt
echo.
echo Inicializando Browser Library...
rfbrowser init
echo.
echo Setup completo! Para usar o projeto:
echo 1. Execute: venv\Scripts\activate.bat
echo 2. Execute: robot tests/cadastro_test.robot
echo 3. Execute: robot tests/login_test.robot
pause