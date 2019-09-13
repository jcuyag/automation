*** Settings ***
Library           ../Lib/Provider/Provider.py

*** Keywords ***
Get current status
    ${current_status}    Get Text    tag:big
    [Return]    ${current_status}

Button Status
    [Arguments]    ${status}

Status is free
    ${status}    Get current status
    ${is_free}=    Provider.Is Status Free    ${status}
    [Return]    ${is_free}

Status is busy
    ${status}    Get current status
    ${is_busy}=    Provider.Is Status Busy    ${status}
    [Return]    ${is_busy}

Set status to busy
    ${button_elem}=    Get WebElement    xpath://button[@label="Busy"]
    Wait Until Element Is Enabled    ${button_elem}    10 sec
    Click Button    ${button_elem}

Set status to free
    ${button_elem}=    Get WebElement    xpath://button[@label="Free"]
    Wait Until Element Is Enabled    ${button_elem}    10 sec
    Click Button    ${button_elem}

Status Should be
    [Arguments]    ${status}
    ${elem}=    Get WebElement    tag:big
    Wait Until Element Contains    ${elem}    ${status}    10 sec
    ${rstat}=    Return From Keyword    ${True}
    [Return]    ${rstat}
