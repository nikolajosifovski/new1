*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/Register.robot

*** Keywords ***
Generate Random Username
    ${random1}    String.Generate Random String    12    [NUMBERS]
    ${RandomUsername}    Catenate    User${random1}
    Set Global Variable    ${RandomUsername}

Generate Random Email
    ${random2}    String.Generate Random String    15    [LOWER]
    ${randomEmail}    Catenate    ${random2}@example.com
    Set Global Variable    ${randomEmail}
    [Return]    ${randomEmail}

Generate Random Password
    ${randomPassword}    String.Generate Random String    15
    Set Global Variable    ${randomPassword}
    [Return]    ${randomPassword}

Verify that User is registred
    Wait Until Page Contains Element    //*[@id="post-9"]/div/nav/ul/li[1]/a    20
    ${LoggedUser}    Get Text    //*[@id="post-9"]/div/div/p[1]/strong[1]
    Comment    Should Be Equal As Strings    ${LoggedUser}    ${RandomUsername}

Register User
    [Arguments]    ${username}    ${email}    ${password}
    Input Text    ${UsernameInput_Register}    ${username}
    Input Text    ${EmailInput_Register}    ${email}
    Input Password    ${PasswordInput_Register}    ${password}
    Wait Until Keyword Succeeds    20    2    Click Element    ${RegisterBtn}
