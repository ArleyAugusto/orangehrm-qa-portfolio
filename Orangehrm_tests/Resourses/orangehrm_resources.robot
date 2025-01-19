*** Settings ***
Library    SeleniumLibrary

*** Variables ***

# Url pagina de Login
#     
${LOGIN_URL}                                 https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

# Elementos da página
${BOTAO_LOGIN}                               //button[@type='submit'][contains(.,'Login')]
${CAMPO_USUARIO}                             //input[contains(@name,'username')]
${CAMPO_SENHA}                               //input[contains(@type,'password')]
${PAGINA_INICIAL}                            //p[@class='oxd-text oxd-text--p'][contains(.,'Time at Work')]  
${CREDENCIAIS_INVALIDAS}                     //div[@class='oxd-alert-content oxd-alert-content--error'][contains(.,'Invalid credentials')] 
${ERRO_CREDENCIAL_REQUIRED}                   //span[@class='oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message'][contains(.,'Required')]


# Credenciais de Login
${USUARIO_VALIDO}                            Admin                                      # Usuário válido
${SENHA_VALIDA}                              admin123                                   # Senha válida
${USUARIO_INVALIDO}                          usuario_invalido                           # Usuário inválido
${SENHA_INVALIDA}                            senha_invalida                             # Senha inválida



*** Keywords *** 

Abrir o navegador
    Open Browser    ${LOGIN_URL}    chrome     
    
Fechar o navegador
    Close Browser

Dado que o usuário está na tela de login
    Go To                        ${LOGIN_URL}
    Maximize Browser Window
    Wait Until Page Contains Element    ${BOTAO_LOGIN}

Quando insere usuário corretamente no campo "Username"
    Input Text    ${CAMPO_USUARIO}    ${USUARIO_VALIDO}    

E insere senha corretamente no campo "Password"
    Input Text    ${CAMPO_SENHA}    ${SENHA_VALIDA}

E clica no botão "Login"
    Click Button    ${BOTAO_LOGIN}

Então é redirecionado para a página inicial do sistema
    Wait Until Element Is Visible       ${PAGINA_INICIAL}
    Sleep    3s
    Capture Page Screenshot             Reports/login_sucesso.png        

E insere senha inválida no campo "Password"
    Input Text    ${CAMPO_SENHA}    ${SENHA_INVALIDA}

Então sistema exibe mensagem de erro "Invalid credentials"
    Wait Until Page Contains Element     ${CREDENCIAIS_INVALIDAS}
    Sleep    2s   
    Capture Page Screenshot              Reports/login_senha_invalida.png    

Quando insere usuário inválido no campo "Username" 
    Input Text    ${CAMPO_USUARIO}    ${USUARIO_INVALIDO}   

Quando usuário não preenche o campo "Username"
     Clear Element Text    ${CAMPO_USUARIO}

E não preenche o campo "Password"
    Clear Element Text    ${CAMPO_SENHA}

Então sistema exibe mensagem de erro "Required" abaixo dos dois campos
    Wait Until Element Is Visible    ${ERRO_CREDENCIAL_REQUIRED}
    Sleep    2s
    Capture Page Screenshot              Reports/login_usuario_senha_obrigatorios.png  

Então sistema exibe mensagem de erro "Required" abaixo do campo "Password"
    Wait Until Element Is Visible    ${ERRO_CREDENCIAL_REQUIRED}
    Sleep    2s
    Capture Page Screenshot              Reports/login_senha_obrigatoria.png     

 Então sistema exibe mensagem de erro "Required" abaixo do campo "Username"
    Wait Until Element Is Visible    ${ERRO_CREDENCIAL_REQUIRED}
    Sleep    2s
    Capture Page Screenshot              Reports/login_usuario_obrigatorio.png    