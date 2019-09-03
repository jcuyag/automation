*** Settings ***
Documentation     Viemed automation assessment
Suite Teardown
Library           SeleniumLibrary
Library           String
Library           OperatingSystem

*** Variables ***
${LOGIN URL}      https://telemed.viemed.io
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    [Tags]    valid_login
    Open Browser To Login Page
    Input Username
    Input Password
    Submit Credentials
    Provider Home Page    PROVIDER HOME
    [Teardown]

Free to Busy
    Check Status    Free
    Change status    Busy
    Sleep    1 sec
    Check Status    Busy
    [Teardown]

Busy to Free
    Check Status    Busy
    Change status    Free
    Sleep    1 sec
    Check Status    Free

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Telemed

Input Username
    ${user}    Get Environment Variable    USERNAME
    Input Text    email    ${user}

Input Password
    ${pass}    Get Environment Variable    PASSWORD
    Input Text    password    ${pass}

Submit Credentials
    Click Button    Login

Provider Home Page
    [Arguments]    ${page_name}
    Wait Until Page Contains    ${page_name}    30 sec

Check Status
    [Arguments]    ${status}
    Wait Until Element Contains    tag:big    ${status}    10 sec    Status is not ${status}

Change status
    [Arguments]    ${new_status}
    Wait Until Element Is Enabled    xpath://button[@label="${new_status}"]
    Click Button    ${new_status}
