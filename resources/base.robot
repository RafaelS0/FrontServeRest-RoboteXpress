*** Settings ***

Library        Browser
Library        RequestsLibrary
Library        Collections
Library        String

*** Variables ***
${API_BASE_URL}        https://compassuol.serverest.dev
${email}               test@test.com.br
${password}            pwd123
${user_id}

*** Keywords ***

Start Session
    
    New Browser        browser=chromium        headless=False
    New Page           https://compassuolfront.serverest.dev/

Criar usuário

    [Documentation]        Cria um novo usuário via API.
    Create Session         serverest       ${API_BASE_URL}    disable_warnings=True

    ${user_body}=          Create Dictionary
    ...                    nome=Tester
    ...                    email=${email}
    ...                    password=${password}
    ...                    administrador=true

    ${response} =          POST On Session    serverest    /usuarios    json=${user_body}
    Status Should Be       201    ${response}  
    Set Global Variable    ${user_id}        ${response.json()['_id']}
    Log                    Usuário criado com sucesso. ID: ${user_id}

Deletar usuário criado

    [Documentation]        Deleta o usuário criado via API.
    ${response} =          DELETE On Session    serverest    /usuarios/${user_id}
    Status Should Be       200    ${response}
    Should Be Equal As Strings    ${response.json()['message']}    Registro excluído com sucesso
    Log                    Usuário deletado com sucesso.