*** Settings ***
Documentation     Locators for all pages

*** Variables ***
&{LOC_NAV}
...    home_nav=xpath=//a[contains(text(), ' Home')]
...    products_nav=xpath=//a[@href='/products']
...    cart_nav=xpath=//a[@href='/view_cart']
...    test_cases_nav=xpath=//a[contains(@href, '/test_cases')]
...    contact_us_nav=xpath=//a[@href='/contact_us']

&{LOC_AUTH}
...    login_signup_nav=xpath=//a[@href='/login']
...    signup_name=css=input[data-qa="signup-name"]
...    signup_email=css=input[data-qa="signup-email"]
...    signup_button=css=button[data-qa="signup-button"]
...    login_email=css=input[data-qa="login-email"]
...    login_password=css=input[data-qa="login-password"]
...    login_button=css=button[data-qa="login-button"]
...    logout_nav=xpath=//a[@href='/logout']
...    delete_account_nav=xpath=//a[@href='/delete_account']
...    continue_btn=css=a[data-qa="continue-button"]
...    logged_in_user=xpath=//a[contains(., 'Logged in as')]
...    error_login_msg=xpath=//p[contains(text(),'Your email or password is incorrect!')]

&{LOC_REG_FORM}
...    title_mr=id=id_gender1
...    title_mrs=id=id_gender2
...    password=id=password
...    day=id=days
...    month=id=months
...    year=id=years
...    newsletter=id=newsletter
...    optin=id=optin
...    first_name=id=first_name
...    last_name=id=last_name
...    company=id=company
...    address1=id=address1
...    address2=id=address2
...    country=id=country
...    state=id=state
...    city=id=city
...    zipcode=id=zipcode
...    mobile=id=mobile_number
...    create_account_btn=css=button[data-qa="create-account"]
...    account_created_heading=xpath=//h2[@data-qa="account-created"]
...    account_deleted_heading=xpath=//h2[@data-qa="account-deleted"]

&{LOC_CONTACT_US}
...    title=xpath=//h2[contains(text(), 'Get In Touch')]
...    name=css=input[data-qa="name"]
...    email=css=input[data-qa="email"]
...    subject=css=input[data-qa="subject"]
...    message=css=textarea[data-qa="message"]
...    upload_file=css=input[name="upload_file"]
...    submit_btn=css=input[data-qa="submit-button"]
...    success_msg=xpath=//div[contains(@class, 'alert-success')]
...    home_btn=xpath=//div[@id='form-section']//a[contains(., 'Home')]

&{LOC_PRODUCTS}
...    title=xpath=//h2[contains(text(), 'All Products')]
...    search_input=id=search_product
...    search_btn=id=submit_search
...    searched_title=xpath=//h2[contains(text(), 'Searched Products')]
...    product_list=xpath=//div[@class='features_items']//div[@class='col-sm-4']
...    first_product_view_btn=xpath=(//a[contains(@href, '/product_details/')])[1]
...    first_product_add_to_cart_btn=xpath=(//div[@class='productinfo text-center']//a[contains(@class, 'add-to-cart')])[1]
...    second_product_add_to_cart_btn=xpath=(//div[@class='productinfo text-center']//a[contains(@class, 'add-to-cart')])[2]
...    continue_shopping_btn=xpath=//button[contains(text(), 'Continue Shopping')]
...    view_cart_modal_btn=xpath=//div[@class='modal-content']//a[@href='/view_cart']

&{LOC_PRODUCT_DETAIL}
...    name=xpath=//div[@class='product-information']/h2
...    category=xpath=//div[@class='product-information']/p[contains(text(), 'Category')]
...    price=xpath=//div[@class='product-information']/span/span
...    availability=xpath=//div[@class='product-information']/p[contains(., 'Availability')]
...    condition=xpath=//div[@class='product-information']/p[contains(., 'Condition')]
...    brand=xpath=//div[@class='product-information']/p[contains(., 'Brand')]
...    quantity_input=id=quantity
...    add_to_cart_btn=xpath=//button[contains(@class, 'cart')]

&{LOC_CART}
...    table_rows=xpath=//tbody/tr
...    price=xpath=//td[@class='cart_price']/p
...    quantity=xpath=//td[@class='cart_quantity']/button
...    total=xpath=//td[@class='cart_total']/p
...    proceed_to_checkout_btn=xpath=//a[contains(text(), 'Proceed To Checkout')]
...    register_login_btn=xpath=//div[@class='modal-content']//a[@href='/login']

&{LOC_CHECKOUT}
...    address_delivery=id=address_delivery
...    address_billing=id=address_invoice
...    review_order=id=cart_info
...    comment_textarea=xpath=//textarea[@name='message']
...    place_order_btn=xpath=//a[contains(@href, '/payment')]

&{LOC_PAYMENT}
...    name_on_card=css=input[data-qa="name-on-card"]
...    card_number=css=input[data-qa="card-number"]
...    cvc=css=input[data-qa="cvc"]
...    expiry_month=css=input[data-qa="expiry-month"]
...    expiry_year=css=input[data-qa="expiry-year"]
...    pay_btn=css=button[data-qa="pay-button"]
...    order_success_msg=xpath=//h2[@data-qa="order-placed"]

&{LOC_FOOTER}
...    title=xpath=//h2[contains(text(), 'Subscription')]
...    email_input=id=susbscribe_email
...    subscribe_btn=id=subscribe
...    success_msg=xpath=//div[contains(@class, 'alert-success')]

&{LOC_TEST_CASES}
...    title=xpath=//h2/b[contains(text(), 'Test Cases')]

