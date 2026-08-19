*** Settings ***
Documentation     Keywords for shop pages (Products, Cart, Subscription)
Library           SeleniumLibrary
Resource          common.resource
Resource          locators.resource

*** Keywords ***
Navigate To Products Page
    [Documentation]    Navigate to Products page
    Safe Click    ${LOC_NAV.products_nav}
    Remove Ads If Present

Verify Products Page Is Visible
    [Documentation]    Verify ALL PRODUCTS title is visible
    Wait Until Element Is Visible    ${LOC_PRODUCTS.title}    ${CONFIG.timeout}

Search For Product
    [Documentation]    Search for a product
    [Arguments]    ${search_text}
    Input Text    ${LOC_PRODUCTS.search_input}    ${search_text}
    Safe Click    ${LOC_PRODUCTS.search_btn}

Verify Searched Products Are Visible
    [Documentation]    Verify SEARCHED PRODUCTS title and items
    Wait Until Element Is Visible    ${LOC_PRODUCTS.searched_title}    ${CONFIG.timeout}
    Element Should Be Visible    ${LOC_PRODUCTS.product_list}

Navigate To Test Cases Page
    [Documentation]    Navigate to Test Cases page
    Safe Click    ${LOC_NAV.test_cases_nav}
    Remove Ads If Present

Verify Test Cases Page Is Visible
    [Documentation]    Verify TEST CASES title is visible
    Wait Until Element Is Visible    ${LOC_TEST_CASES.title}    ${CONFIG.timeout}

Subscribe In Footer
    [Documentation]    Enter email in footer subscription and submit
    [Arguments]    ${email}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    ${LOC_FOOTER.title}    ${CONFIG.timeout}
    Input Text    ${LOC_FOOTER.email_input}    ${email}
    Safe Click    ${LOC_FOOTER.subscribe_btn}
    Wait Until Element Is Visible    ${LOC_FOOTER.success_msg}    ${CONFIG.timeout}

Add First Product To Cart
    [Documentation]    Hover over first product and click Add to cart
    Safe Click    ${LOC_PRODUCTS.first_product_add_to_cart_btn}
    Wait Until Element Is Visible    ${LOC_PRODUCTS.continue_shopping_btn}    ${CONFIG.timeout}

Add Second Product To Cart
    [Documentation]    Hover over second product and click Add to cart
    Safe Click    ${LOC_PRODUCTS.second_product_add_to_cart_btn}
    Wait Until Element Is Visible    ${LOC_PRODUCTS.continue_shopping_btn}    ${CONFIG.timeout}

Continue Shopping
    [Documentation]    Click Continue Shopping button on modal
    Safe Click    ${LOC_PRODUCTS.continue_shopping_btn}

Navigate To Cart Page
    [Documentation]    Navigate to Cart page via header or modal
    Safe Click    ${LOC_NAV.cart_nav}
    Remove Ads If Present

Verify Cart Products Count
    [Documentation]    Verify the number of products in cart
    [Arguments]    ${expected_count}
    Wait Until Element Is Visible    ${LOC_CART.table_rows}    ${CONFIG.timeout}
    ${count}=    Get Element Count    ${LOC_CART.table_rows}
    Should Be Equal As Integers    ${count}    ${expected_count}

Add Product To Cart From Detail Page
    [Documentation]    Set quantity and add product to cart from product detail page
    [Arguments]    ${quantity}=1
    Remove Ads If Present
    Clear Element Text    ${LOC_PRODUCT_DETAIL.quantity_input}
    Input Text    ${LOC_PRODUCT_DETAIL.quantity_input}    ${quantity}
    Safe Click    ${LOC_PRODUCT_DETAIL.add_to_cart_btn}
    Wait Until Element Is Visible    ${LOC_PRODUCTS.view_cart_modal_btn}    ${CONFIG.timeout}

View Cart From Modal
    [Documentation]    Click View Cart button in the modal popup
    Safe Click    ${LOC_PRODUCTS.view_cart_modal_btn}

Proceed To Checkout
    [Documentation]    Click Proceed To Checkout button on cart page
    Safe Click    ${LOC_CART.proceed_to_checkout_btn}

Verify Checkout Page Is Visible
    [Documentation]    Verify checkout page with address and order review
    Wait Until Element Is Visible    ${LOC_CHECKOUT.address_delivery}    ${CONFIG.timeout}
    Element Should Be Visible    ${LOC_CHECKOUT.review_order}

Fill Payment Details And Confirm
    [Documentation]    Fill payment form and click Pay and Confirm Order
    [Arguments]    ${name_on_card}    ${card_number}    ${cvc}    ${expiry_month}    ${expiry_year}
    Input Text    ${LOC_PAYMENT.name_on_card}     ${name_on_card}
    Input Text    ${LOC_PAYMENT.card_number}      ${card_number}
    Input Text    ${LOC_PAYMENT.cvc}              ${cvc}
    Input Text    ${LOC_PAYMENT.expiry_month}     ${expiry_month}
    Input Text    ${LOC_PAYMENT.expiry_year}      ${expiry_year}
    Safe Click    ${LOC_PAYMENT.pay_btn}

Enter Comment And Place Order
    [Documentation]    Enter comment on checkout page and click Place Order
    [Arguments]    ${comment}=Order placed via automation
    Input Text    ${LOC_CHECKOUT.comment_textarea}    ${comment}
    Safe Click    ${LOC_CHECKOUT.place_order_btn}

Verify Order Placed Successfully
    [Documentation]    Verify order success message is visible
    Wait Until Element Is Visible    ${LOC_PAYMENT.order_success_msg}    ${CONFIG.timeout}
