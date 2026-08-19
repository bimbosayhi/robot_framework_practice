*** Settings ***
Documentation     Test Cases Page
Resource          ../resources/common.resource
Resource          ../resources/shop.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Teardown     Take Screenshot On Failure

*** Test Cases ***
TC07: Verify Test Cases Page
    [Documentation]    Verify user can navigate to Test Cases page
    Navigate To Test Cases Page
    Verify Test Cases Page Is Visible
