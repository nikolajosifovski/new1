*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/Search.robot
Resource          ../Resources/Testdata.robot

*** Keywords ***
Open Search Box
    Click Element    ${SearchIcon_TopMenu}
    #wait untill title is visible
    Wait Until Element Is Visible    ${SearchBoxTitle}
    #check that titel contins expected text
    Element Text Should Be    ${SearchBoxTitle}    TYPE TO SEARCH

Search item
    [Arguments]    ${Search_Item}
    Open Search Box
    Input Text    ${SearchInputFieldLocator_SearchBox}    ${Search_Item}
    Wait Until Page Contains Element    ${SearchBoxButtonLocator}
    Click Element    (//*[@type="submit"])[2]
