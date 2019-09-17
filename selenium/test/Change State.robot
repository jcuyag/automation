*** Settings ***
Documentation     Viemed automation assessment
Variables         ../Config/constant.py
Resource          ../Resources/login.robot
Resource          ../Resources/page.robot
Library           SeleniumLibrary
Resource          ../Resources/provider.robot

*** Test Cases ***
Valid Login
    [Tags]    valid_login
    [Setup]
    Submit Credentials
    Alert Should Not Be Present

Invalid Login
    [Tags]    invalid_login
    Submit Credentials    'sdfdsfsfdsff'    'sdfdsfdfsdfsdf'
    Alert Should Be Present    Incorrect username or password.

Free to Busy
    [Tags]    free_to_busy
    [Setup]    Submit Credentials
    Provider
    ${is_free}=    Status Should be    Free
    Run Keyword If    ${is_free} == ${False}    Set status to free
    Status Should be    Free
    Set status to busy
    Status Should be    Busy
    [Teardown]

Busy to Free
    [Tags]    busy_to_free
    [Setup]    Submit Credentials
    Provider
    ${is_busy}=    Status Should be    Busy
    Run Keyword If    ${is_busy} == ${False}    Set status to busy
    Status Should be    Busy
    Set status to free
    Status Should be    Free

*** Keywords ***
Check Status
    [Arguments]    ${status}
    Wait Until Element Contains    tag:big    ${status}    10 sec    Status is not ${status}

Change status
    [Arguments]    ${new_status}
    Wait Until Element Is Enabled    xpath://button[@label="${new_status}"]
    Click Button    ${new_status}
