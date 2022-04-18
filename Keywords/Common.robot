*** Settings ***
Library           SeleniumLibrary
Resource          Common.robot
Resource          ../PageObjects/HomePage.robot
Resource          ../Resources/Testdata.robot

*** Keywords ***
Open app
    Open Browser    ${Homepage_URL}    ${browser}
    Maximize Browser Window
