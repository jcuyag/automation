*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Resource          page.robot

*** Keywords ***
Provider Home Page
    Wait Until Page Contains    PROVIDER HOME    30 sec

Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Login Form

Input Username
    ${user}    Get Environment Variable    USERNAME
    Input Text    email    ${user}

Input Password
    ${pass}    Get Environment Variable    PASSWORD
    Input Text    password    ${pass}

Submit Credentials
    Click Button    Login

Valid Login
    Open Browser To Login Page
    Input Username
    Input Password
    Submit Credentials
    Provider Home Page
