*** Settings ***

Library    Browser

Resource    env.resource
Resource    services.resource
Resource    ../resources/pages/UserCreateAdminPage.resource

*** Keywords ***
Start Session
    New Browser    ${BROWSER}    headless=False    
    New Page    ${BASE_URL}


Limpar Usuario
    [Arguments]    ${user}
    POST - Fazer Login    ${user}
    IF    ${response.status_code} == 200
        GET - Buscar Usuario Por Email    ${user}
        DELETE - Apagar um usuário    ${user_id}
    END
