*** Settings ***
Documentation    Ações e elementos da página de criação de usuário como um Administrador

Library    Browser

Resource    ../services.resource

*** Keywords ***

Gerar Administrador
    [Arguments]    ${user}
    POST - Fazer Login    ${user}
    IF    ${response.status_code} == 200
        GET - Buscar Usuario Por Email    ${user}
        DELETE - Apagar um usuário    ${user_id}
    END
        POST - Registrar Usuario    ${user}

Fazer Login como Administrador
    [Arguments]    ${user}
    Fill Text   data-testid=email    ${user['email']}
    Fill Text   data-testid=senha    ${user['password']}
    Click    data-testid=entrar
    Sleep    3s


Enviar formulário de criação de usuário como admin
    [Arguments]    ${user}
    Click    data-testid=cadastrar-usuarios
    Fill Text   data-testid=nome    ${user}[nome]
    Fill Text   data-testid=email    ${user}[email]
    Fill Text   data-testid=password    ${user}[password]
    Sleep    2s
    IF    $user['administrador'] == "true"
        Click   data-testid=checkbox
    END
    Click    data-testid=cadastrarUsuario
    Sleep    1s

Validar mensagem de erro
    [Arguments]    ${expected_text}
    Wait For Elements State    xpath=//span[text()='${expected_text}']

Validar redirecionamento para lista de usuários
    ${current_url}=    Get Url
    Should Contain    ${current_url}    /admin/listarusuarios







   
