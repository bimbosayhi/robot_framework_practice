*** Settings ***
Documentation     Login User with correct email and password.
Resource          ../resources/common.resource
Resource          ../resources/auth.resource

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
TC02: Login User With Correct Email And Password
    [Documentation]    Login User With Correct Email And Password
    Navigate To Login / Signup Page
    ${login_email}=    Generate Dynamic Email    prefix=test_login
    Submit Initial Signup Form    name=${USER_DATA.first_name} ${USER_DATA.last_name}    email=${login_email}
    Fill Full Registration Form Using Dictionary    &{USER_DATA}
    Logout User From System
    
    Navigate To Login / Signup Page
    Login User With Credentials    ${login_email}    ${USER_DATA.password}
    Verify User Logged In Successfully    expected_username=${USER_DATA.first_name} ${USER_DATA.last_name}
    Delete User Account From System
