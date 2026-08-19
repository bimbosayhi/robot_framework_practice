*** Settings ***
Documentation     Place Order: Register before Checkout
Resource          ../resources/common.resource
Resource          ../resources/auth.resource
Resource          ../resources/shop.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Teardown     Take Screenshot On Failure

*** Variables ***
&{USER_DATA}
...    gender=Mr
...    password=Password123
...    dob_day=15
...    dob_month=6
...    dob_year=1995
...    newsletter=${True}
...    optin=${True}
...    first_name=Test
...    last_name=User
...    company=Testing
...    address1=123 Automation St
...    address2=Suite 400
...    country=Canada
...    state=Ontario
...    city=Toronto
...    zipcode=123A
...    mobile=1234567890

*** Test Cases ***
TC15: Place Order Register Before Checkout
    [Documentation]    Register first, then add products and place order
    Navigate To Login / Signup Page
    ${email}=    Generate Dynamic Email    prefix=tc15_reg
    Submit Initial Signup Form    name=${USER_DATA.first_name} ${USER_DATA.last_name}    email=${email}
    Fill Full Registration Form Using Dictionary    &{USER_DATA}
    Verify User Logged In Successfully    expected_username=${USER_DATA.first_name} ${USER_DATA.last_name}
    
    Add First Product To Cart
    Continue Shopping
    
    Navigate To Cart Page
    Verify Cart Products Count    1
    Proceed To Checkout
    Verify Checkout Page Is Visible
    
    Enter Comment And Place Order    comment=TC15 order via automation
    Fill Payment Details And Confirm
    ...    name_on_card=${USER_DATA.first_name} ${USER_DATA.last_name}
    ...    card_number=4100000000000000
    ...    cvc=123
    ...    expiry_month=12
    ...    expiry_year=2030
    Verify Order Placed Successfully
    
    Delete User Account From System
