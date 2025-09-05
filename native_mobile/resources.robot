*** Settings ***
Library    AppiumLibrary

*** Variables ***
${PLATFORM_NAME}         iOS
${AUTOMATION_NAME}       XCUITest
${DEVICE_NAME}           iPhone.*
${PLATFORM_VERSION}      18
${SAUCE_URL}             https://ondemand.us-west-1.saucelabs.com:443/wd/hub
${APP_ID}                storage:filename=SauceLabs-Demo-App.ipa

&{SAUCE_OPTIONS}         username=%{SAUCE_USERNAME}    accessKey=%{SAUCE_ACCESS_KEY}    appiumVersion=latest    name=My Real Device Test

*** Keywords ***
Open My Mobile App
    Open Application    ${SAUCE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    appium:automationName=${AUTOMATION_NAME}
    ...    appium:deviceName=${DEVICE_NAME}
    ...    appium:platformVersion=${PLATFORM_VERSION}
    ...    appium:app=${APP_ID}
    ...    sauce:options=${SAUCE_OPTIONS}

*** Keywords ***
End Session
    [Documentation]    Sends pass/fail status to Sauce Labs and closes the app
    # Determine Sauce Labs status
    ${status}=    Set Variable If    '${TEST_STATUS}'=='PASS'    passed    failed
    ${sauce_command}=    Set Variable    sauce:job-result=${status}
    # Send the command BEFORE closing the app
    Execute Script    ${sauce_command}
    # Close the session
    Close Application
