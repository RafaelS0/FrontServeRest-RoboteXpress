*** Settings ***
Resource    ../resources/keywords.robot
Test Setup    Setup Browser
Test Teardown    Close Browser
Suite Setup    Verificar Usuario Cadastrado

*** Variables ***
${NOME}
${EMAIL}
${PASSWORD}

*** Keywords ***
Verificar Usuario Cadastrado
    ${user_data}=    Carregar Dados Usuario
    IF    ${user_data} == ${None}
        Fail    Nenhum usuário cadastrado encontrado. Execute primeiro o teste de cadastro.
    END
    Set Suite Variable    ${NOME}        ${user_data}[nome]
    Set Suite Variable    ${EMAIL}       ${user_data}[email]
    Set Suite Variable    ${PASSWORD}    ${user_data}[password]

*** Test Cases ***
Login Com Usuario Valido
    [Documentation]    Valida login com usuário previamente cadastrado
    Fill Text    css=input[type="email"]    ${EMAIL}
    Fill Text    css=input[type="password"]    ${PASSWORD}
    Click    css=button[type="submit"]
    Sleep    3s
    ${current_url}=    Get Url
    Should Not Contain    ${current_url}    /login
    Log    Login realizado com sucesso para: ${EMAIL}

Login Com Email Invalido
    [Documentation]    Valida erro com email inválido
    Fill Text    css=input[type="email"]    email_invalido@teste.com
    Fill Text    css=input[type="password"]    ${PASSWORD}
    Click    css=button[type="submit"]
    Sleep    2s
    ${current_url}=    Get Url
    Should Contain    ${current_url}    /login

Login Com Senha Incorreta
    [Documentation]    Valida erro com senha incorreta
    Fill Text    css=input[type="email"]    ${EMAIL}
    Fill Text    css=input[type="password"]    senha_errada
    Click    css=button[type="submit"]
    Sleep    2s
    ${current_url}=    Get Url
    Should Contain    ${current_url}    /login

Login Com Campos Vazios
    [Documentation]    Valida erro com campos vazios
    Click    css=button[type="submit"]
    Sleep    2s
    ${current_url}=    Get Url
    Should Contain    ${current_url}    /login