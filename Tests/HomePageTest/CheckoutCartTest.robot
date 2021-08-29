*** Settings ***
Library           SeleniumLibrary
Library           Collections
Resource          ../../Resources/powerbuy/CommonFunctionality.robot
Resource          ../../Resources/powerbuy/CatalogSearchFunctionality.robot
Resource          ../../Resources/powerbuy/CatalogDetailFunctionality.robot
Resource          ../../Resources/powerbuy/CartFunctionality.robot

Test Setup  Start TestCase
Test Teardown  Finish TestCase

*** Test Cases ***

Select item and validate cart
    Search with kyeword  TV
    Filter with Screen Size  ${44-55INCHES}
    Select item into cart  ${FirstItemFromReturnList}
    Back to TV Section
    Filter with Screen Size  ${32-43INCHES}
    Select item into cart  ${FirstItemFromReturnList}
    Checkout and Validate Cart  ${SelectedItem}




