*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Resource          page.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Login Form

Send Environment Value
    [Arguments]    ${var}
    ${upper_var}=    Convert To Uppercase    ${var}
    ${val}    Get Environment Variable    ${upper_var}
    Input Text    ${var}    ${val}

Submit Credentials
    [Arguments]    ${username}=None    ${password}=None
    Open Browser To Login Page
    Input Username    ${username}
    Input Password    ${password}
    Click Login button

Input Username
    [Arguments]    ${email}
    Run Keyword If    ${email} == ${None}    Send Environment Value    email
    ...    ELSE    Input Text    email    ${email}

Input Password
    [Arguments]    ${password}
    Run Keyword If    ${password} == ${None}    Send Environment Value    password
    ...    ELSE    Input Text    password    ${password}

Click Login button
    Click Button    Login
