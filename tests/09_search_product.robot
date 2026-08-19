*** Settings ***
Documentation     Search Product
Resource          ../resources/common.resource
Resource          ../resources/shop.resource

Suite Setup       Open Application
Suite Teardown    Close Application
Test Teardown     Take Screenshot On Failure

*** Test Cases ***
TC09: Search Product
    [Documentation]    Verify search product functionality
    Navigate To Products Page
    Verify Products Page Is Visible
    
    Search For Product    Blue Top
    Verify Searched Products Are Visible
