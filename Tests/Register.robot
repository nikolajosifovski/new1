*** Settings ***
Test Setup        Open app
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Register.robot
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Login.robot
Resource          ../Resources/Testdata.robot

*** Test Cases ***
TC0004_Register user with valid credintials
    Navigate to Login/Register page
    Generate Random Username
    Generate Random Email
    Generate Random Password
    Register User    ${RandomUsername}    ${randomEmail}    ${randomPassword}
    Verify that User is registred

TC0005_Register with empty email
    Navigate to Login/Register page
    Generate Random Username
    Generate Random Email
    Generate Random Password
    Register User    ${RandomUsername}    ${EMPTY}    ${randomPassword}
    Wait Until Element Is Visible    class:woocommerce-notices-wrapper
    Wait Until Page Contains    Error: Please provide a valid email address.
    Element Should Contain    //div[@class="woocommerce-notices-wrapper"]    Error: Please provide a valid email address.
