*** Settings ***
Documentation    Ações e elementos da página de gerar Cliente

Library    Browser

Resource    ../services.resource

*** Keywords ***
Gerar Cliente
    [Arguments]    ${user}
    POST - Fazer Login    ${user}
    IF    ${response.status_code} == 200
        GET - Buscar Usuario Por Email    ${user}
        DELETE - Apagar um usuário    ${user_id}
    END
        POST - Registrar Usuario    ${user}

 Fazer Login 
    [Arguments]    ${user}
    Fill Text   data-testid=email    ${user['email']}
    Fill Text   data-testid=senha    ${user['password']}
    Click    data-testid=entrar
    Sleep    3s       

Adicionar um produto a lista de compra
 [Arguments] ${nome}
  Click    [data-testid^="adicionarNalLista"]:has-text("${nome}")         
  Sleep    1s 