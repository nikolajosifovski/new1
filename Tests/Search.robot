*** Settings ***
Test Setup        Open app
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Register.robot
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Login.robot
Resource          ../Resources/Testdata.robot
Resource          ../Keywords/Search.robot
Library           Collections

*** Variables ***
@{product_prices}

*** Test Cases ***
Search Avaliable Item
    #Search for item that is specified in the variable
    Search item    ${SEARCH_ITEM}
    #Verify Search results
    Page Should Contain    ${SEARCH_ITEM}

Search Item that is not existing
    Search item    ${Invalid_Search_Item}
    #Verify Search results
    Element Text Should Be    //p[@class="woocommerce-info"]    No products were found matching your selection.

Search and Verify all results
    Search item    ${SEARCH_ITEM}
    #Verify Search results
    Page Should Contain    ${SEARCH_ITEM}
    #
    ${counter}    Get Element Count    //*[@class="woocommerce-loop-product__title"]
    #FOR
    FOR    ${i}    IN RANGE    1    ${counter} + 1
        ${ItemTitle}    Get Text    (//*[@class="woocommerce-loop-product__title"])[${i}]
        Should Contain    ${ItemTitle}    ${SEARCH_ITEM}    ignore_case=True
    END

New search TC
    Log     This is new TC
