*** Settings ***
Documentation     Register new user account on Automation Exercise.
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
TC01: Register User
    [Documentation]    Create new account with dynamically generated email, then delete the account to clean up the data
    
    Navigate To Login / Signup Page
    
    ${random_email}=    Generate Dynamic Email    prefix=user_tc01
    Submit Initial Signup Form    name=${USER_DATA.first_name} ${USER_DATA.last_name}    email=${random_email}
    
    Verify Mandatory Form Fields Exist Using FOR Loop
    
    Fill Full Registration Form Using Dictionary    &{USER_DATA}
    
    Verify User Logged In Successfully    expected_username=${USER_DATA.first_name} ${USER_DATA.last_name}
    
    Delete User Account From System
