*** Settings ***
Library    Browser
Library    String

*** Variables ***
${URL}               https://compassuolfront.serverest.dev/cadastrarusuarios
${BTN_CADASTRAR}     css=button[data-testid="cadastrar"]
${CHECK_ADMIN}       id=administrador
${BTN_CADASTRAR}     css=button[type="submit"]
${MSG_SUCESSO}       css=a.alert-link
${MSG_ERRO}          class="alert alert-secondary alert-dismissible"

*** Keywords ***
Abrir Tela de Cadastro
    New Browser    chromium    headless=False
    New Page    ${URL}
    Click    ${BTN_CADASTRAR}

Gerar Email Aleatorio
    ${letras}=    Generate Random String    5    [LOWER]
    ${email}=    Set Variable    ${letras}@qa.com
    RETURN    ${email}

Preencher Formulário
    [Arguments]    ${nome}    ${email}    ${senha}    ${admin}=False
    Fill Text    id=nome    ${nome}
    Fill Text    id=email    ${email}
    Fill Text    id=password    ${senha}


Preencher Formulário como Administrador
    [Arguments]    ${nome}    ${email}    ${senha}    ${admin}=True
    Fill Text    id=nome    ${nome}
    Fill Text    id=email    ${email}
    Fill Text    id=password    ${senha}
    IF    ${admin}
        Check Checkbox    ${CHECK_ADMIN}
    END

Submeter Cadastro
    Click    ${BTN_CADASTRAR}
    Wait For Elements State    ${MSG_SUCESSO}    visible    timeout=15s