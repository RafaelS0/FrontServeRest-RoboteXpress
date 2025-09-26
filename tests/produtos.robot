*** Settings ***
Documentation        Cenários de teste endpoint produtos

Resource        ../resources/base.resource

Library        FakerLibrary        locale=pt_BR

*** Test Cases ***
Listagem de produtos

    Criar usuário
    
    Start Session

    Wait For Elements State        css=h1        visible        5
    Get Text                       css=h1        equal          Login

    Fill Text        data-testid=email       ${email}
    Fill Text        data-testid=senha    ${password}

    Click            data-testid=entrar

    Wait For Elements State        css=.jumbotron h1      visible        5
    Get Text                       css=.jumbotron h1      contains       Bem Vindo

    
    Go To        https://compassuolfront.serverest.dev/admin/listarprodutos

    Wait For Elements State        css=.jumbotron h1      visible        5
    Get Text                       css=.jumbotron h1      equal          Lista dos Produtos
    
Deve poder cadastrar um novo produto


    Start Session

    Wait For Elements State        css=h1        visible        5
    Get Text                       css=h1        equal          Login

    Fill Text        data-testid=email       ${email}
    Fill Text        data-testid=senha    ${password}

    Click            data-testid=entrar

    Wait For Elements State        css=.jumbotron h1      visible        5
    Get Text                       css=.jumbotron h1      contains       Bem Vindo

    
    Go To        https://compassuolfront.serverest.dev/admin/cadastrarprodutos
    
    Wait For Elements State        css=.jumbotron h1      visible        5
    Get Text                       css=.jumbotron h1      equal          Cadastro de Produtos

    ${nome}=             FakerLibrary.Bothify              text=Produto-?#?#?#
    ${preco}=            FakerLibrary.Random Number        digits=3
    ${descricao}=        FakerLibrary.Paragraph
    ${quantidade}=       FakerLibrary.Random Number        digits=3

    Fill Text        data-testid=nome            ${nome}
    Fill Text        data-testid=preco           ${preco}
    Fill Text        data-testid=descricao       ${descricao}
    Fill Text        data-testid=quantity        ${quantidade}

    Click            data-testid=cadastarProdutos

    Wait For Elements State        css=.jumbotron h1      visible        5
    Get Text                       css=.jumbotron h1      equal          Lista dos Produtos

    Deletar usuário criado