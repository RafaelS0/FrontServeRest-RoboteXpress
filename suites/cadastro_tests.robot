*** Settings ***
Resource    ../resources/cadastro_page.robot
Library     Browser
Library    String

Test Setup    Abrir Tela de Cadastro
Test Teardown    Close Browser

*** Test Cases ***
Cadastro Válido
    ${email}=    Gerar Email Aleatorio
    Preencher Formulário    Fulano Teste    ${email}    senha123
    Submeter Cadastro
    Get Text    ${MSG_SUCESSO}    contains    Cadastro realizado com sucesso

Cadastro como Administrador Válido
    ${email}=    Gerar Email Aleatorio
    Preencher Formulário como Administrador    Fulano Teste    ${email}    senha123
    Submeter Cadastro
    Get Text    ${MSG_SUCESSO}    contains    Cadastro realizado com sucesso