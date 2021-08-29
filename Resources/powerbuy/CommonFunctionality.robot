*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${WEBSITE URL}      https://www.powerbuy.co.th/th
${BROWSER}          chrome

*** Keywords ***

Start TestCase
    Open Browser  ${WEBSITE URL}  ${BROWSER}
    Maximize Browser Window

Finish TestCase
    Close Browser