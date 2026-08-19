*** Settings ***
Documentation     Verify Product quantity in Cart
Resource          ../resources/common.resource
Resource          ../resources/shop.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Teardown     Take Screenshot On Failure

*** Test Cases ***
TC13: Verify Product Quantity In Cart
    [Documentation]    Verify product is displayed in cart with exact quantity
    Safe Click    ${LOC_PRODUCTS.first_product_view_btn}
    Remove Ads If Present
    
    Wait Until Element Is Visible    ${LOC_PRODUCT_DETAIL.name}    ${CONFIG.timeout}
    
    Add Product To Cart From Detail Page    quantity=4
    View Cart From Modal
    
    Wait Until Element Is Visible    ${LOC_CART.table_rows}    ${CONFIG.timeout}
    Element Should Contain    ${LOC_CART.quantity}    4
