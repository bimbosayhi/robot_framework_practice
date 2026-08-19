*** Settings ***
Documentation     Contact Us form test case
Resource          ../resources/common.resource
Resource          ../resources/auth.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Teardown     Take Screenshot On Failure

*** Variables ***
${DUMMY_FILE}    ${EXECDIR}/resources/testdata/dummy_upload.txt

*** Test Cases ***
TC06: Contact Us Form
    [Documentation]    Verify Contact Us form and file upload
    Safe Click    ${LOC_NAV.contact_us_nav}
    Remove Ads If Present
    Wait Until Element Is Visible    ${LOC_CONTACT_US.title}    ${CONFIG.timeout}
    
    Input Text    ${LOC_CONTACT_US.name}          Test User
    Input Text    ${LOC_CONTACT_US.email}         testuser@example.com
    Input Text    ${LOC_CONTACT_US.subject}       Test Subject
    Input Text    ${LOC_CONTACT_US.message}       This is a test message.
    Choose File   ${LOC_CONTACT_US.upload_file}   ${DUMMY_FILE}
    
    Safe Click    ${LOC_CONTACT_US.submit_btn}
    Handle Alert  ACCEPT
    
    Wait Until Element Is Visible    ${LOC_CONTACT_US.success_msg}    ${CONFIG.timeout}
    Safe Click    ${LOC_CONTACT_US.home_btn}