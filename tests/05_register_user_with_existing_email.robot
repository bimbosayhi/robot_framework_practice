*** Settings ***
Documentation     Register user with existing email
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
TC05: Register User With Existing Email
    [Documentation]    register user with existing email
    Navigate To Login / Signup Page
    
    ${existing_email}=    Generate Dynamic Email    prefix=test_exist
    Submit Initial Signup Form    name=${USER_DATA.first_name} ${USER_DATA.last_name}    email=${existing_email}
    Fill Full Registration Form Using Dictionary    &{USER_DATA}
    Logout User From System
    
    Navigate To Login / Signup Page
    Input Text    ${LOC_AUTH.signup_name}     ${USER_DATA.first_name} ${USER_DATA.last_name}
    Input Text    ${LOC_AUTH.signup_email}    ${existing_email}
    Safe Click    ${LOC_AUTH.signup_button}
    
    Wait Until Page Contains    Email Address already exist!    ${CONFIG.timeout}
    Capture Named Screenshot    01_Email_Exists_Error
