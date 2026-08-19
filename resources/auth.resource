*** Settings ***
Documentation     Keywords for authentication: Signup, Login, Logout, Delete Account
Library           SeleniumLibrary
Resource          common.resource
Resource          locators.resource

*** Keywords ***
Navigate To Login / Signup Page
    [Documentation]    Navigate to the Signup / Login page
    Go To    ${CONFIG.url}login
    Remove Ads If Present
    Wait Until Element Is Visible    ${LOC_AUTH.signup_name}    ${CONFIG.timeout}

Submit Initial Signup Form
    [Documentation]    Submit name and email on the initial signup form
    [Arguments]    ${name}    ${email}
    Input Text    ${LOC_AUTH.signup_name}     ${name}
    Input Text    ${LOC_AUTH.signup_email}    ${email}
    Safe Click    ${LOC_AUTH.signup_button}
    Wait Until Page Contains    Enter Account Information    ${CONFIG.timeout}

Fill Full Registration Form Using Dictionary
    [Documentation]    Fill the complete registration form using a dictionary of user data
    [Arguments]    &{user_info}

    IF    '${user_info.gender}' == 'Mr'
        Click Element    ${LOC_REG_FORM.title_mr}
    ELSE IF    '${user_info.gender}' == 'Mrs'
        Click Element    ${LOC_REG_FORM.title_mrs}
    END

    Input Text    ${LOC_REG_FORM.password}    ${user_info.password}
    Select From List By Value    ${LOC_REG_FORM.day}      ${user_info.dob_day}
    Select From List By Value    ${LOC_REG_FORM.month}    ${user_info.dob_month}
    Select From List By Value    ${LOC_REG_FORM.year}     ${user_info.dob_year}

    IF    ${user_info.newsletter}
        Select Checkbox    ${LOC_REG_FORM.newsletter}
    END

    IF    ${user_info.optin}
        Select Checkbox    ${LOC_REG_FORM.optin}
    END

    Input Text    ${LOC_REG_FORM.first_name}    ${user_info.first_name}
    Input Text    ${LOC_REG_FORM.last_name}     ${user_info.last_name}
    Input Text    ${LOC_REG_FORM.company}       ${user_info.company}
    Input Text    ${LOC_REG_FORM.address1}      ${user_info.address1}
    Input Text    ${LOC_REG_FORM.address2}      ${user_info.address2}
    Select From List By Value    ${LOC_REG_FORM.country}    ${user_info.country}
    Input Text    ${LOC_REG_FORM.state}        ${user_info.state}
    Input Text    ${LOC_REG_FORM.city}         ${user_info.city}
    Input Text    ${LOC_REG_FORM.zipcode}      ${user_info.zipcode}
    Input Text    ${LOC_REG_FORM.mobile}       ${user_info.mobile}

    Safe Click    ${LOC_REG_FORM.create_account_btn}
    Wait Until Element Is Visible    ${LOC_REG_FORM.account_created_heading}    ${CONFIG.timeout}
    Capture Named Screenshot    02_Account_Created
    Go To    ${CONFIG.url}

Verify Mandatory Form Fields Exist Using FOR Loop
    [Documentation]    Verify all mandatory registration fields are visible
    @{mandatory_locators}=    Create List
    ...    ${LOC_REG_FORM.first_name}
    ...    ${LOC_REG_FORM.last_name}
    ...    ${LOC_REG_FORM.password}
    ...    ${LOC_REG_FORM.address1}
    ...    ${LOC_REG_FORM.mobile}

    FOR    ${loc}    IN    @{mandatory_locators}
        Element Should Be Visible    ${loc}
    END

Verify User Logged In Successfully
    [Documentation]    Verify the user is logged in with the expected username
    [Arguments]    ${expected_username}
    Wait Until Element Is Visible    ${LOC_AUTH.logged_in_user}    ${CONFIG.timeout}
    Element Should Contain           ${LOC_AUTH.logged_in_user}    ${expected_username}
    Capture Named Screenshot    03_Logged_In_User

Login User With Credentials
    [Documentation]    Login with the given email and password
    [Arguments]    ${email}    ${password}
    Input Text    ${LOC_AUTH.login_email}       ${email}
    Input Text    ${LOC_AUTH.login_password}    ${password}
    Safe Click    ${LOC_AUTH.login_button}

Logout User From System
    [Documentation]    Logout the current user
    Go To    ${CONFIG.url}logout
    Wait Until Element Is Visible    ${LOC_AUTH.login_button}    ${CONFIG.timeout}
    Capture Named Screenshot    04_Logged_Out

Delete User Account From System
    [Documentation]    Delete the current user account
    Go To    ${CONFIG.url}delete_account
    Wait Until Element Is Visible    ${LOC_REG_FORM.account_deleted_heading}    ${CONFIG.timeout}
    Capture Named Screenshot    05_Account_Deleted
    Go To    ${CONFIG.url}
