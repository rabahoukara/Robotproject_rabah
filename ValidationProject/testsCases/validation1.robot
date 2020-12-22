*** Settings ***

Library    SeleniumLibrary    
*** Variables ***
${url}=    https://opensource-demo.orangehrmlive.com/
${browser}=    gc
*** Test Cases ***
TC_001_validerText
    open Browser  ${url}    ${browser}
    Maximize Browser Window
      
    Input Text    id=txUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin 
    #Page Should Contain    Dashboard 
     Page Should not Contain     Dashboard123     
    Click Element    id=welcome  
    Sleep    4s   
    Click Link    link=Logout  
    Close Browser 
    
TC_001_Validation_Textfield    
    open Browser  ${url}    ${browser}
    Maximize Browser Window
    #Page Should Contain Textfield    id=txUsername 
    Page Should Not Contain Textfield   id=txUser54   
    Input Text    id=txUsername    Admin
    #Page Should Contain Textfield    id=txtPassword
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin 
    #Page Should Contain    Dashboard 
     Page Should not Contain     Dashboard123     
    Click Element    id=welcome  
    Sleep    4s   
    Click Link    link=Logout  
    Close Browser 
    
TC003_validation_check_box
       
    Open Browser    https://login.salesforce.com/?locale=fr-ca    gc  
    Maximize Browser Window
    Click Element    id=rememberUn    
    Checkbox Should Be Selected    id=rememberUn
    Sleep    4s
    Click Element    id=rememberUn 
    Checkbox Should Not Be Selected    id=rememberUn
    
TC004_validation_msg_erreur_login
    Open Browser    https://login.salesforce.com/?locale=fr-ca    gc  
    Maximize Browser Window
    Input Text    username    text    
    Input Password    password    pass
    Sleep    4s
    Click Button    id=Login    
    #Element Text Should Be    id=error    Vérifiez votre nom d'utilisateur et votre mot de passe. Si vous ne parvenez toujours pas à vous connecter, contactez votre administrateur Salesforce.   
    Element Should Contain    id=error   Vérifiez votre nom d'utilisateur et votre mot de passe    
TC005_valider_title
    Open Browser    https://login.salesforce.com/?locale=fr-ca    gc  
    Maximize Browser Window
    Title Should Be    Connexion | Salesforce
    #Element Should Be Enabled   id=username  
    #Element Should Be Disabled   id=username 
    Element Should Be Visible    id=username   
    
