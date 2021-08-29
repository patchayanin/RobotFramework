*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Cart}  //*[@id="btn-openMiniCart"]/img
${CartHeader}  //*[@class="Padding-sc-10o2jvk-0 jYpZwl"]
${productID}  //*[@data-productid='{0}']
${CartItems}  //*[@data-product-section="Cart"]

*** Keywords ***

Checkout and Validate Cart
    [Arguments]  ${SelectedItem}
    Sleep  5s
    Click Element  ${Cart}
    Sleep  5s
    Wait Until Element is visible  ${CartHeader}
    Validate Cart Item  ${SelectedItem}

Validate Cart Item
    [Arguments]  ${SelectedItem}
    ${elements}=  Get WebElements  ${CartItems}
    FOR  ${cartItem}  IN  @{elements}
        ${cart-productID}=  Get Element Attribute  ${cartItem}  data-productid
        List Should Contain Value  ${SelectedItem}  ${cart-productID}
    END