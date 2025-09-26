*** Settings ***
Documentation    Requisições para API ServeRest
Library   RequestsLibrary

*** Keywords ***
POST - Registrar Usuario
    [Arguments]          ${user}
    &{header}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary
    ...    nome=${user}[nome]
    ...    email=${user}[email]
    ...    password=${user}[password]
    ...    administrador=${user}[administrador]
    Create Session    ServeRest    https://compassuol.serverest.dev/
    ${response}=    POST On Session    alias=ServeRest    url=/usuarios    json=${payload}    headers=${header}    expected_status=any
    Log       Response Status: ${response.status_code}
    Log       Response: ${response.content}
    BuiltIn.Set Global Variable    ${response}


POST - Fazer Login 
    [Arguments]    ${user}  
    ${payload}=    Create Dictionary    email=${user}[email]    password=${user}[password]
    Create Session    ServeRest    https://compassuol.serverest.dev/
    ${response}=    POST On Session    alias=ServeRest    url=/login    json=${payload}    expected_status=any     
    Set Global Variable    ${response}
    Log    ${response.content}



GET - Buscar Usuario por email
    [Arguments]    ${user}
    Create Session    ServeRest    https://compassuol.serverest.dev/
    ${response}=    GET On Session    alias=ServeRest    url=/usuarios?email=${user}[email]    expected_status=any
    ${response_json}=    Set Variable    ${response.json()}
    IF    'usuarios' in $response_json
        ${usuarios}=    Set Variable    ${response_json['usuarios']}
        IF    len($usuarios) > 0
            ${user_id}=    Set Variable    ${usuarios[0]['_id']}
            Set Global Variable    ${user_id}
        END
    END

DELETE - Apagar um usuário
    [Arguments]          ${_id}
    &{header}=    Create Dictionary    Content-Type=application/json
    Create Session    ServeRest    https://compassuol.serverest.dev/
    ${response}=    DELETE On Session    alias=ServeRest    url=/usuarios/${_id}        headers=${header}    expected_status=any
    Log       Response Status: ${response.status_code}
    Log       Response: ${response.content}
    BuiltIn.Set Global Variable    ${response}