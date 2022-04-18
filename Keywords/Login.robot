*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/HomePage.robot
Resource          ../PageObjects/LoginPage.robot
Resource          ../PageObjects/HomePage.robot

*** Keywords ***
Navigate to Login/Register page
    Click Element    ${LoginREgisterBtn_TopMenu}
    Element Text Should Be    ${LoginLabel_LoginPage}    Login

Login User
    [Arguments]    ${arg1}    ${arg2}
    Input Text    ${UsernameINput_Login}    ${arg1}
    Input Password    ${PasswordInput_Login}    ${arg2}
    Click Button    ${LoginBtn_LoginPage}

Verify that user is logged in
    Wait Until Element Is Visible    //li[@class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard is-active"]
    Element Text Should Be    //li[@class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard is-active"]    Dashboard
    Element Text Should Be    //*[@id="post-9"]/div/div/p[1]/strong[1]    nikola.iw454

Verify Errror message durring Login
    [Arguments]    ${Error_text}
    Element Should Contain    ${ErrorMessage_Locator_Login}    ${Error_text}
    [Teardown]
