*** Settings ***
Library    Browser
Library    FakerLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${BASE_URL}    https://compassuolfront.serverest.dev
${USER_DATA_FILE}    data/user_data.json

*** Keywords ***
Gerar Dados Usuario
    ${nome}=    FakerLibrary.Name
    ${email}=    FakerLibrary.Email
    ${password}=    Set Variable    123456
    RETURN    ${nome}    ${email}    ${password}

Salvar Dados Usuario
    [Arguments]    ${nome}    ${email}    ${password}
    ${user_data}=    Create Dictionary    nome=${nome}    email=${email}    password=${password}
    ${json_string}=    Evaluate    json.dumps($user_data, indent=2)    json
    Create File    ${USER_DATA_FILE}    ${json_string}

Carregar Dados Usuario
    ${exists}=    Run Keyword And Return Status    File Should Exist    ${USER_DATA_FILE}
    IF    ${exists}
        ${content}=    Get File    ${USER_DATA_FILE}
        ${user_data}=    Evaluate    json.loads($content)    json
        RETURN    ${user_data}
    ELSE
        RETURN    ${None}
    END

Setup Browser
    New Browser    chromium    headless=false
    New Page    ${BASE_URL}