*** Settings ***
Resource    resources.robot
Test Setup    Open My Mobile App
Test Teardown    End Session

*** Test Cases ***
My Real Device Test
    Log To Console    Test is running on a real device.
    Wait Until Page Contains    Sauce Labs Backpack    timeout=10
    Page Should Contain Text    Sauce Labs Backpack