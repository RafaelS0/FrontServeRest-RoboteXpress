*** Settings ***
Documentation        Verificar se a página está online

Resource        ../resources/keywords.robot

*** Test Cases ***
Aplicação deve estar online
    
    Start Session
    Get Title        equal        Front - ServeRest