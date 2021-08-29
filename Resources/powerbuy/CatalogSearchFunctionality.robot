*** Settings ***
Library           SeleniumLibrary
Resource          CatalogDetailFunctionality.robot

*** Variables ***
${SearchBox}  //*[@id="txt-searchBox-input"]
${SearchButton}  //*[@id="btn-searchBox-input"]
${LoadingScreen}   //div[@class='LoadingScreen__Relative-buBEEi bfqcdg']
${FilterBar}       //div[@class='CardBody__Body-sc-1xt43yy-0 gwyEQW']
${BreadcrumbHeader}  //*[@id="lnk-viewBreadcrumb-undefined"]/h1
${44-55INCHES}     //*[text()='44 - 55 นิ้ว']/ancestor::div[@class="Row__Wrapper-v6uxgu-0 kSLyDU"][1]//*[@data-testid='btn-checkbox']
${32-43INCHES}     //*[text()='32 - 43 นิ้ว']/ancestor::div[@class="Row__Wrapper-v6uxgu-0 kSLyDU"][1]//*[@data-testid='btn-checkbox']
${FirstItemFromReturnList}  (//*[text()='จัดส่ง']/ancestor::div[@data-testid="productGrid-item"])[1]

@{SelectedItem}=  Create List

*** Keywords ***

Search with kyeword
    [Arguments]  ${Keyword}
    Input Text  ${SearchBox}  ${Keyword}
    Click Button  ${SearchButton}
    Wait Until Element is Not Visible  ${LoadingScreen}  timeout=10s
    Wait Until Element is visible  ${BreadcrumbHeader}  timeout=5s

Filter with Screen Size
    [Arguments]  ${ScreenSize}
    Wait Until Element is visible  ${FilterBar}  timeout=10s
    Scroll Element Into View  ${ScreenSize}
    Wait Until Element is visible  ${ScreenSize}  timeout=10s
    Set Focus To Element  ${ScreenSize}
    Click Element  ${ScreenSize}
    Wait Until Element is Not Visible  ${LoadingScreen}  timeout=10s

Select item into cart
    [Arguments]  ${item}
    Wait Until Element is visible  ${item}  timeout=15s
    Set Focus To Element  ${item}
    ${data-productID}=  Get Element Attribute  ${item}  data-productid
    Click Element  ${item}
    Add item into cart
    Append To List  ${SelectedItem}  ${data-productID}