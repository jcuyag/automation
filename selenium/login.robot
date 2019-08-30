*** Settings ***
Documentation     Viemed automation assessment
Suite Teardown
Library           SeleniumLibrary
Library           String

*** Variables ***
${LOGIN URL}      https://telemed.viemed.io
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
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

new testcase
    Check Status    Busy
    Change status    Free
    Sleep    1 sec
    Check Status    Busy

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Telemed

Input Username
    [Arguments]    ${username}
    Input Text    email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

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
