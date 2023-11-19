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
Try Register Account 
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s
    Click Element    //a[text()='Register']
    Sleep    ${wait_time}


Test Error Messages "Please fill out this field." AccountID
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s

    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']
    # Input Text    xpath=//input[@id='accountId']    
    # Sleep    ${wait_time}
    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}

    Wait Until Element Is Visible    xpath=//input[@id='accountId'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    ${error_message}    Execute JavaScript    return document.querySelector('input#accountId:invalid').validationMessage
    Log    ${error_message}
    Should Contain    ${error_message}    Please fill out this field.

    Sleep    ${wait_time}    

Test Error Messages "Please fill out this field." Password
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s
        Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']
    # Input Text    xpath=//input[@id='accountId']    
    # Sleep    ${wait_time}
    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}

    Wait Until Element Is Visible    xpath=//input[@id='password'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    ${error_message}    Execute JavaScript    return document.querySelector('input#password:invalid').validationMessage
    Log    ${error_message}
    Should Contain    ${error_message}    Please fill out this field.

    Sleep    ${wait_time}        
    

Test Error Messages "Please fill accountId 10 digits" with input 5 digit
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s
    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']

    Input Text    xpath=//input[@id='accountId']    12345
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}
    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='register-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='register-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please fill accountId  10 digits
    Sleep    ${wait_time}
    # Close the browser or add other actions as needed

Test Error Messages "Please fill accountId 10 digits" with input 11 digit
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s
    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']

    Input Text    xpath=//input[@id='accountId']    12345678910
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}
    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='register-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='register-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please fill accountId  10 digits
    Sleep    ${wait_time}


Test Error Messages "Please fill password 4 digits" with input 1 digit
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s
    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='password']    1
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}
    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='register-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='register-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please fill password 4 digits
    Sleep    ${wait_time}  

Test Error Messages "Please fill password 4 digits" with input 5 digit
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s
    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='password']    12345
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}
    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='register-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='register-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please fill password 4 digits
    Sleep    ${wait_time}    


Test Error Messages "Please fill out this field." firstName
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s

    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']
    # Input Text    xpath=//input[@id='accountId']    
    # Sleep    ${wait_time}
    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}
    # Input Text    xpath=//input[@id='firstName']    Nattapat
    # Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}

    Wait Until Element Is Visible    xpath=//input[@id='firstName'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    ${error_message}    Execute JavaScript    return document.querySelector('input#firstName:invalid').validationMessage
    Log    ${error_message}
    Should Contain    ${error_message}    Please fill out this field.

    Sleep    ${wait_time}   

Test Error Messages "Please fill out this field." lastName
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s

    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']
    # Input Text    xpath=//input[@id='accountId']    
    # Sleep    ${wait_time}
    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    # Input Text    xpath=//input[@id='lastName']    Pitchayanon
    # Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}

    Wait Until Element Is Visible    xpath=//input[@id='lastName'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    ${error_message}    Execute JavaScript    return document.querySelector('input#lastName:invalid').validationMessage
    Log    ${error_message}
    Should Contain    ${error_message}    Please fill out this field.

    Sleep    ${wait_time}   


Test Error Messages "Please fill out this field." firstName & lastName
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s

    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']
    # Input Text    xpath=//input[@id='accountId']    
    # Sleep    ${wait_time}
    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}
    # Input Text    xpath=//input[@id='firstName']    Nattapat
    # Sleep    ${wait_time}
    # Input Text    xpath=//input[@id='lastName']    Pitchayanon
    # Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}

    Wait Until Element Is Visible    xpath=//input[@id='firstName'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    ${error_message}    Execute JavaScript    return document.querySelector('input#firstName:invalid').validationMessage
    Log    ${error_message}
    Should Contain    ${error_message}    Please fill out this field.

    Sleep    ${wait_time}   



 Test Error Messages "Please put accountId only number"
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s
    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']

    Input Text    xpath=//input[@id='accountId']    a123456789
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}
    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='register-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='register-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please put accountId only number
    Sleep    ${wait_time}   


 Test Error Messages "Please put password only number"
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s
    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='password']    A234
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}
    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='register-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='register-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Please put password only number
    Sleep    ${wait_time}  

 Test Error Messages "Account ID already existed"
   
    Wait Until Page Contains Element    //a[text()='Register']    timeout=30s
    Clear Element Text    xpath=//input[@id='accountId'] 
    Clear Element Text    xpath=//input[@id='password']
    Clear Element Text    xpath=//input[@id='firstName']
    Clear Element Text    xpath=//input[@id='lastName']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='firstName']    Nattapat
    Sleep    ${wait_time}
    Input Text    xpath=//input[@id='lastName']    Pitchayanon
    Sleep    ${wait_time}
    Click Button    xpath=//button[@cid='rc']  # Assuming 'rc' is the custom identifier for your 'Register' button
    Sleep    ${wait_time}
    # Wait for error messages to appear using XPath
    Wait Until Element Is Visible    xpath=//label[@cid='register-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='register-error-mes']
    # Close the browser or add other actions as needed
    Should Contain    ${error_message}    Account ID already existed
    Sleep    ${wait_time}   



































