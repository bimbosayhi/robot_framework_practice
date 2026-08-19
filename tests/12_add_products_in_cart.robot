*** Settings ***
Documentation     Add Products in Cart
Resource          ../resources/common.resource
Resource          ../resources/shop.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Teardown     Take Screenshot On Failure

*** Test Cases ***
TC12: Add Products In Cart
    [Documentation]    Add two products to cart and verify cart contents
    Navigate To Products Page
    
    Add First Product To Cart
    Continue Shopping
    
    Add Second Product To Cart
    Continue Shopping
    
    Navigate To Cart Page
    Verify Cart Products Count    2
    
    Element Should Be Visible    ${LOC_CART.price}
    Element Should Be Visible    ${LOC_CART.quantity}
    Element Should Be Visible    ${LOC_CART.total}
