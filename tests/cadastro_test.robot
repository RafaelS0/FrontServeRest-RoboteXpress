*** Settings ***
Resource    ../resources/keywords.robot
Test Setup    Setup Browser
Test Teardown    Close Browser

*** Test Cases ***
Cadastrar Novo Usuario
    [Documentation]    Cria novo usuário via interface e salva dados
    ${nome}    ${email}    ${password}=    Gerar Dados Usuario
    
    # Cadastrar via interface
    Click    text="Cadastre-se"
    Fill Text    css=input[name="nome"]    ${nome}
    Fill Text    css=input[type="email"]    ${email}
    Fill Text    css=input[type="password"]    ${password}
    Click    css=button[type="submit"]
    Sleep    3s
    
    # Salvar dados do usuário
    Salvar Dados Usuario    ${nome}    ${email}    ${password}
    
    # Salvar dados independente do resultado
    Log    Dados salvos: ${nome} - ${email}
    
    # Tentar fazer login para validar cadastro
    Go To    ${BASE_URL}
    Fill Text    css=input[type="email"]    ${email}
    Fill Text    css=input[type="password"]    ${password}
    Click    css=button[type="submit"]
    Sleep    3s
    
    # Validar se login funcionou (indicando que cadastro foi bem-sucedido)
    ${current_url}=    Get Url
    Should Not Contain    ${current_url}    /login
    Log    Cadastro e login validados para: ${email}