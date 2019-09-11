*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String

*** Keywords ***
Login Form
    ${elem}=    Get WebElement    tag:form
    Wait Until Element Contains    ${elem}    Login
    Wait Until Element Contains    ${elem}    Your email
    Wait Until Element Contains    ${elem}    Your password
    Page Should Contain Button    ${elem}

Provider
    Wait Until Location Is    ${PROVIDER_URL}
    Wait Until Page Contains    PROVIDER HOME
    Wait Until Page Contains    Your status is
    Page Should Contain Button    Free
    Page Should Contain Button    Busy
