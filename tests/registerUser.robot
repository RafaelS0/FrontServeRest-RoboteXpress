*** Settings ***
Documentation    Ações e elementos da página de criação de usuário como um Administrador
Library    Browser
Library    Telnet
Resource    ./../resources/base.resource


*** Test Cases ***
Cadastrar um administrador sendo um Administrador com sucesso
    [Tags]    cadastro-adm  
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
    Validar redirecionamento para lista de usuários

Cadastrar um cliente sendo um Administrador com sucesso
    [Tags]    cadastro-adm  
    Start Session 
  
    ${admin_user}    Create Dictionary
    ...    nome=Steve Jobs
    ...    email=steve.jobs@apple.com
    ...    password=apple123
    ...    administrador=true
    
    ${new_user_data}    Create Dictionary    
    ...    nome=Pedro Souza
    ...    email=pedro.souza.cliente@serverest.com
    ...    password=pwd1234
    ...    administrador=false

    Gerar Administrador    ${admin_user}
    Fazer Login como Administrador    ${admin_user}
    Limpar Usuario    ${new_user_data}
    Enviar formulário de criação de usuário como admin    ${new_user_data}
    Validar redirecionamento para lista de usuários

Cadastrar um usuário duplicado sendo um Administrador 
    [Tags]    cadastro-adm-dup    
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
    
    Limpar Usuario    ${new_user_data}
    Gerar Administrador    ${admin_user}
    Fazer Login como Administrador    ${admin_user}
    POST - Registrar Usuario    ${new_user_data}
    Enviar formulário de criação de usuário como admin    ${new_user_data}
    Validar mensagem de erro    Este email já está sendo usado

Cadastrar um usuário sem nome sendo um Administrador  
    [Tags]    cadastro-adm-invalido   
    Start Session 
    
    ${admin_user}    Create Dictionary
    ...    nome=Steve Jobs
    ...    email=steve.jobs@apple.com
    ...    password=apple123
    ...    administrador=true
    
    ${new_user_data}    Create Dictionary    
    ...    nome=
    ...    email=pedro.souza@serverest.com
    ...    password=pwd1234
    ...    administrador=true
    
    
    Gerar Administrador    ${admin_user}
    Fazer Login como Administrador    ${admin_user}
    POST - Registrar Usuario    ${new_user_data}
    Enviar formulário de criação de usuário como admin    ${new_user_data}
    Validar mensagem de erro    Nome é obrigatório

Cadastrar um usuário sem e-mail sendo um Administrador  
    [Tags]    cadastro-adm-invalido   
    Start Session 
    
    ${admin_user}    Create Dictionary
    ...    nome=Steve Jobs
    ...    email=steve.jobs@apple.com
    ...    password=apple123
    ...    administrador=true
    
    ${new_user_data}    Create Dictionary    
    ...    nome=Pedro Souza
    ...    email=
    ...    password=pwd1234
    ...    administrador=true
    
    
    Gerar Administrador    ${admin_user}
    Fazer Login como Administrador    ${admin_user}
    POST - Registrar Usuario    ${new_user_data}
    Enviar formulário de criação de usuário como admin    ${new_user_data}
    Validar mensagem de erro    Email é obrigatório

Cadastrar um usuário sem senha sendo um Administrador  
    [Tags]    cadastro-adm-invalido   
    Start Session 
    
    ${admin_user}    Create Dictionary
    ...    nome=Steve Jobs
    ...    email=steve.jobs@apple.com
    ...    password=apple123
    ...    administrador=true
    
    ${new_user_data}    Create Dictionary    
    ...    nome=Pedro Souza
    ...    email=pedro.souza@serverest.com
    ...    password=
    ...    administrador=true
    
   
    Gerar Administrador    ${admin_user}
    Fazer Login como Administrador    ${admin_user}
    POST - Registrar Usuario    ${new_user_data}
    Enviar formulário de criação de usuário como admin    ${new_user_data}
    Validar mensagem de erro    Password é obrigatório

Cadastrar um cliente com um e-mail utilizado por um administrador sendo Administrador
    [Tags]    cadastro-adm-invalido
    Start Session 
  
    ${admin_user}    Create Dictionary    
    ...    nome=Steve Jobs
    ...    email=steve.jobs@apple.com
    ...    password=apple123
    ...    administrador=true
    
    ${new_user_data}    Create Dictionary    
    ...    nome=Pedro Souza Pereira
    ...    email=pedro.souza@serverest.com
    ...    password=pwd1234
    ...    administrador=false
    
    ${new_adm_data}    Create Dictionary    
    ...    nome=Pedro Souza Silva
    ...    email=pedro.souza@serverest.com
    ...    password=snh1234
    ...    administrador=true

    Limpar Usuario    ${new_user_data}
    Limpar Usuario    ${new_adm_data}
    POST - Registrar Usuario    ${new_adm_data}    # Registrar administrador
    Gerar Administrador    ${admin_user}
    Fazer Login como Administrador    ${admin_user}
    Enviar formulário de criação de usuário como admin    ${new_user_data}
    Validar mensagem de erro    Este email já está sendo usado