@echo off
echo Ativando ambiente virtual...
call venv\Scripts\activate.bat
echo.
echo Executando teste de cadastro...
robot tests/cadastro_test.robot
echo.
echo Executando testes de login...
robot tests/login_test.robot
echo.
echo Testes concluidos! Verifique os arquivos:
echo - log.html (detalhes com screenshots)
echo - report.html (resumo dos testes)
pause