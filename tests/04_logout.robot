*** Settings ***
Documentation     Logout User From System.
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
TC04: Logout User
    [Documentation]    Đăng nhập tài khoản và thực hiện Đăng xuất khỏi hệ thống
    Navigate To Login / Signup Page
    ${user_email}=    Generate Dynamic Email    prefix=test_logout
    Submit Initial Signup Form    name=${USER_DATA.first_name} ${USER_DATA.last_name}    email=${user_email}
    Fill Full Registration Form Using Dictionary    &{USER_DATA}
    Logout User From System
