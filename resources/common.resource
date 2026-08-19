*** Settings ***
Documentation     Common keywords for browser management and utilities
Library           SeleniumLibrary
Library           DateTime
Library           String
Variables         variables.py

*** Keywords ***
Open Application
    [Documentation]    Open browser and navigate to base URL
    Open Browser    ${CONFIG.url}    ${CONFIG.browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${CONFIG.implicit_wait}
    Wait Until Element Is Visible    xpath=//a[@href='/']    ${CONFIG.timeout}
    Capture Page Screenshot    filename=00_Open_Application.png

Close Application
    [Documentation]    Close all browser instances
    Close All Browsers

Generate Dynamic Email
    [Documentation]    Generate a unique email address using timestamp
    [Arguments]    ${prefix}=testuser
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${email}=    Set Variable    ${prefix}_${timestamp}@gmail.com
    RETURN    ${email}

Capture Named Screenshot
    [Documentation]    Capture screenshot with descriptive filename
    [Arguments]    ${step_name}=step
    ${clean_test_name}=    Replace String    ${TEST NAME}    :    _
    ${clean_test_name}=    Replace String    ${clean_test_name}    ${SPACE}    _
    Capture Page Screenshot    filename=${clean_test_name}_${step_name}.png

Take Screenshot On Failure
    [Documentation]    Automatically capture screenshot when a test fails
    IF    '${TEST NAME}' != '${EMPTY}'
        ${clean_test_name}=    Replace String    ${TEST NAME}    :    _
        ${clean_test_name}=    Replace String    ${clean_test_name}    ${SPACE}    _
        Run Keyword If Test Failed    Capture Page Screenshot    filename=FAILED_${clean_test_name}.png
    ELSE
        Run Keyword If Test Failed    Capture Page Screenshot    filename=FAILED_test.png
    END

Remove Ads If Present
    [Documentation]    Remove Google ads iframes and elements from the page
    Execute JavaScript    
    ...    var ads = document.querySelectorAll('iframe[id^="aswift"], iframe[name^="aswift"], div[id^="google_ads"], ins.adsbygoogle');
    ...    ads.forEach(function(el) { el.remove(); });

Safe Click
    [Documentation]    Scroll element into view and click it safely
    [Arguments]    ${locator}
    Remove Ads If Present
    Wait Until Element Is Visible    ${locator}    ${CONFIG.timeout}
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript    arguments[0].scrollIntoView({block: 'center'}); arguments[0].click();    ARGUMENTS    ${element}
