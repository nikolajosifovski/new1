*** Settings ***
Test Setup        Open app
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Login.robot
Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/LoginPage.robot
Resource          ../PageObjects/HomePage.robot

*** Test Cases ***
TC0001_Login with valid credintials
    Navigate to Login/Register page
    Login User    ${Valid_Login_Username}    ${Valid_Login_Password}
    Verify that user is logged in

TC0002_Login with wrong username
    Navigate to Login/Register page
    Login User    ${Wrong_Login_Username}    ${Valid_Login_Password}
    Verify Errror message durring Login    ${ErrorMessage_WrongUsername_Login}

TC0003_Login with empty username
    Navigate to Login/Register page
    Login User    ${EMPTY}    ${Valid_Login_Password}
    Verify Errror message durring Login    ${EmptyUser_Error_message}
