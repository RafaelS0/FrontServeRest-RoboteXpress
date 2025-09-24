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
    GET - Buscar Usuario por email    ${user}
    IF    '${user_id}' != '${EMPTY}'
        DELETE - Apagar um usuário    ${user_id}
    END
    
