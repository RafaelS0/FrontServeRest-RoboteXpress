*** Settings ***
Documentation    Ações e elementos da página de criação de usuário como um Administrador
Library    Browser
Library    Telnet
Resource    ./../resources/base.resource



*** Test Cases ***
Cadastrar um usuário como Administrador com sucesso
    [Documentation]    Teste para cadastrar um usuário com perfil de Administrador com sucesso.
    Start Session 
  
    ${admin_user}    Create Dictionary
    ...    nome=Steve Jobs
    ...    email=steve.jobs@apple.com
    ...    password=apple123
    ...    administrador=true
    
    ${new_user_data}    Create Dictionary    
    ...    nome=Pedro Souza
    ...    email=pedro.souza@serverest.com
    ...    password=pwd1234
    ...    administrador=true

    Gerar Administrador    ${admin_user}
    Fazer Login como Administrador    ${admin_user}
    Limpar Usuario    ${new_user_data}
    Enviar formulário de criação de usuário como admin    ${new_user_data}