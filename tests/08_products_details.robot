*** Settings ***
Documentation     Products Details
Resource          ../resources/common.resource
Resource          ../resources/shop.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Teardown     Take Screenshot On Failure

*** Test Cases ***
TC08: Verify All Products And Product Detail Page
    [Documentation]    Verify all products page and first product detail page
    Navigate To Products Page
    Verify Products Page Is Visible
    Element Should Be Visible    ${LOC_PRODUCTS.product_list}
    
    Safe Click    ${LOC_PRODUCTS.first_product_view_btn}
    Remove Ads If Present
    
    Wait Until Element Is Visible    ${LOC_PRODUCT_DETAIL.name}    ${CONFIG.timeout}
    Element Should Be Visible    ${LOC_PRODUCT_DETAIL.category}
    Element Should Be Visible    ${LOC_PRODUCT_DETAIL.price}
    Element Should Be Visible    ${LOC_PRODUCT_DETAIL.availability}
    Element Should Be Visible    ${LOC_PRODUCT_DETAIL.condition}
    Element Should Be Visible    ${LOC_PRODUCT_DETAIL.brand}
