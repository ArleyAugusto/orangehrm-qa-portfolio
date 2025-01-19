*** Settings ***
Library          SeleniumLibrary
Resource         ../Resourses/orangehrm_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

CT001-001-Login válido
    [Tags]    login
    [Documentation]    Validar login com credencias preenchidas corretamente    
    Dado que o usuário está na tela de login
    Quando insere usuário corretamente no campo "Username"
    E insere senha corretamente no campo "Password"
    E clica no botão "Login"
    Então é redirecionado para a página inicial do sistema

 CT001-002-Login com senha inválida
    [Tags]    login   
    [Documentation]    Validar mensagem de erro ao utilizar uma senha inválida 
    Dado que o usuário está na tela de login
    Quando insere usuário corretamente no campo "Username"
    E insere senha inválida no campo "Password"
    E clica no botão "Login"
    Então sistema exibe mensagem de erro "Invalid credentials"

 CT001-003-Login com usuário inválido
    [Tags]    login
    [Documentation]    Validar mensagem de erro ao utilizar um usuário inválido 
    Dado que o usuário está na tela de login
    Quando insere usuário inválido no campo "Username"
    E insere senha corretamente no campo "Password"
    E clica no botão "Login"
    Então sistema exibe mensagem de erro "Invalid credentials"

 CT001-004-Login com campos vazios    
    [Tags]    login
    [Documentation]    Validar mensagem de erro de preenchimento obrigatório
    Dado que o usuário está na tela de login
    Quando usuário não preenche o campo "Username"
    E não preenche o campo "Password"
    E clica no botão "Login"
    Então sistema exibe mensagem de erro "Required" abaixo dos dois campos 

CT001-005-Login com usuário válido e senha vazia
    [Tags]    login
    [Documentation]    Validar a exibição de erro ao tentar logar sem preencher campo senha
    Dado que o usuário está na tela de login
    Quando insere usuário corretamente no campo "Username"
    E não preenche o campo "Password"
    E clica no botão "Login"
    Então sistema exibe mensagem de erro "Required" abaixo do campo "Password"
    
CT001-006-Login com usuário vazio e senha válida
    [Tags]    login
    [Documentation]    Validar a exibição de erro ao tentar logar sem preencher campo usuário
    Dado que o usuário está na tela de login
    Quando usuário não preenche o campo "Username"
    E insere senha corretamente no campo "Password"
    E clica no botão "Login"
    Então sistema exibe mensagem de erro "Required" abaixo do campo "Username"
