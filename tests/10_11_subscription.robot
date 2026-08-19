*** Settings ***
Documentation     Verify Subscription
Resource          ../resources/common.resource
Resource          ../resources/shop.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Teardown     Take Screenshot On Failure

*** Test Cases ***
TC10: Verify Subscription In Home Page
    [Documentation]    Verify subscription from Home page footer
    ${email}=    Generate Dynamic Email    prefix=sub_home
    Subscribe In Footer    ${email}

TC11: Verify Subscription In Cart Page
    [Documentation]    Verify subscription from Cart page footer
    Navigate To Cart Page
    ${email}=    Generate Dynamic Email    prefix=sub_cart
    Subscribe In Footer    ${email}
