*** Settings ***
Documentation     Login failure scenarios using Test Template on Automation Exercise

Resource          ../resources/common.resource
Resource          ../resources/auth.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Setup        Navigate To Login / Signup Page
Test Teardown     Take Screenshot On Failure

Test Template     Verify Login Failure Scenarios

*** Keywords ***
Verify Login Failure Scenarios
    [Documentation]    Template keyword that verifies login fails with expected error message
    [Arguments]    ${email}    ${password}    ${expected_error_message}
    Login User With Credentials    ${email}    ${password}
    Wait Until Page Contains       ${expected_error_message}    ${CONFIG.timeout}

*** Test Cases ***                                    EMAIL                            PASSWORD          EXPECTED MESSAGE
TC03_1: Login With Invalid Password                   invalid_user@gmail.com           wrongpass123      Your email or password is incorrect!
TC03_2: Login With Non-Existent Email                 notfound999@gmail.com            123456            Your email or password is incorrect!
TC03_3: Login With Wrong Domain Email                 user@domaindoesnotexist.com      123456            Your email or password is incorrect!
TC03_4: Login With Special Characters In Password     invalid_user@gmail.com           !@#$%^&*()        Your email or password is incorrect!
