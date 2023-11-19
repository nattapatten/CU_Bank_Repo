*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${wait_time}    2s

***Test Cases ***
Open CU Bank With Chrome
    Open Browser    http://localhost:3000    browser=chrome
    Maximize Browser Window
    Sleep    ${wait_time}
    #Close Browser
ทดสอบการ login ที่ไม่ผ่าน (Try Login Account without Account Number and Password )
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s
    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    Wait Until Element Is Visible    xpath=//input[@id='accountId'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    ${error_message}    Execute JavaScript    return document.querySelector('input#accountId:invalid').validationMessage
    Log    ${error_message}
    Should Contain    ${error_message}    Please fill out this field.

    Sleep    ${wait_time}

ทดสอบการ login ที่ไม่ผ่าน (Try Login with Some Account No and Empty Password)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s
    
    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    Wait Until Element Is Visible    xpath=//input[@id='password'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    ${error_message}    Execute JavaScript    return document.querySelector('input#password:invalid').validationMessage
    Log    ${error_message}
    Should Contain    ${error_message}    Please fill out this field.

    Sleep    ${wait_time}

ทดสอบการ login ที่ไม่ผ่าน (Try Login with Some Password and Empty Account No)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s

    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']
    
    Input Text    xpath=//input[@id='password']    1111
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    Wait Until Element Is Visible    xpath=//input[@id='accountId'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    ${error_message}    Execute JavaScript    return document.querySelector('input#accountId:invalid').validationMessage
    Log    ${error_message}
    Should Contain    ${error_message}    Please fill out this field.

    Sleep    ${wait_time}

    

ทดสอบการ login ที่ไม่ผ่าน (Test Message "Please fill accountId 10 digits" Try Login with 1 Digit AccountID)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s


    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    1
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1111
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='login-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='login-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please fill accountId 10 digits
    Sleep    ${wait_time}


ทดสอบการ login ที่ไม่ผ่าน (Test Message "Please fill accountId 10 digits" Try Login with 11 Digit AccountID)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s


    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    12345678910
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1111
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='login-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='login-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please fill accountId 10 digits
    Sleep    ${wait_time}


ทดสอบการ login ที่ไม่ผ่าน (Test Message "Please fill password 4 digits" Try Login with 1 Digit Password)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s


    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='login-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='login-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please fill password 4 digits
    Sleep    ${wait_time}

 ทดสอบการ login ที่ไม่ผ่าน (Test Message "Please fill password 4 digits" Try Login with 5 Digit Password)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s


    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    12345
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='login-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='login-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please fill password 4 digits
    Sleep    ${wait_time}   




ทดสอบการ login ที่ไม่ผ่าน (Try Login with Not Numeric Account ID and Numeric Password)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s

    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    A1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1111
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='login-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='login-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please put accountId only number
    Sleep    ${wait_time}


ทดสอบการ login ที่ไม่ผ่าน (Try Login with Numeric Account ID and Not Numeric Password)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s
    

    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    A111
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='login-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='login-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please put password only number
    Sleep    ${wait_time}

ทดสอบการ login ที่ไม่ผ่าน (Try Login with Not Exists AccountID)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s


    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    9876543210
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1111
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='login-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='login-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Not Found User
    Sleep    ${wait_time}


ทดสอบการ login ที่ไม่ผ่าน (Try Login with Correct Account No and Wrong Password)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s


    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1111
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}

    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='login-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='login-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Password Incorrect
    Sleep    ${wait_time}


ทดสอบการ login ที่ผ่าน (Try Login With Correct Account ID and Correct Password And Success)
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s

    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}    

     Wait Until Element Is Visible    xpath=//input[@cid='d1']
     Sleep    ${wait_time} 


     Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[3]/div[1]/h2
     Element Should Be Visible    //*[@id="root"]/div/div/div/div[3]/div[1]/h2