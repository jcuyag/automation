*** Settings ***
Documentation     Viemed automation assessment
Test Teardown     Close Browser
Variables         ../Config/constant.py
Resource          ../Resources/login.robot

*** Test Cases ***
Free to Busy
    [Tags]    free_to_busy
    [Setup]    Valid Login
    Check Status    Free
    Change status    Busy
    Sleep    1 sec
    Check Status    Busy
    [Teardown]

Busy to Free
    [Tags]    busy_to_free
    [Setup]    Valid Login
    Check Status    Busy
    Change status    Free
    Sleep    1 sec
    Check Status    Free

*** Keywords ***
Check Status
    [Arguments]    ${status}
    Wait Until Element Contains    tag:big    ${status}    10 sec    Status is not ${status}

Change status
    [Arguments]    ${new_status}
    Wait Until Element Is Enabled    xpath://button[@label="${new_status}"]
    Click Button    ${new_status}
