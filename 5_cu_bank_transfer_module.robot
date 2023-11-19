*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${wait_time}    2s
${wait_time_mid}    5s
${initial_maximum_balance}    1000000
${initial_text}
${initial_integer}
${new_text} 

***Test Cases ***
Open CU Bank With Chrome
    Open Browser    http://localhost:3000    browser=chrome
    Maximize Browser Window
    Sleep    ${wait_time}

Try Login With Correct Account ID and Correct Password
    Wait Until Page Contains Element    xpath=//button[@cid='lc']     timeout=30s

    Clear Element Text    xpath=//input[@id='accountId']
    Clear Element Text    xpath=//input[@id='password']

    Input Text    xpath=//input[@id='accountId']    1234567890
    Sleep    ${wait_time}

    Input Text    xpath=//input[@id='password']    1234
    Sleep    ${wait_time}

    Click Button    xpath=//button[@cid='lc']
     Sleep    ${wait_time}    

     Wait Until Element Is Visible    xpath=//input[@cid='w1']
     Sleep    ${wait_time} 

      Wait Until Element Is Visible    //*[@id="root"]/div/div/div/div[3]/div[1]/h2
     Element Should Be Visible    //*[@id="root"]/div/div/div/div[3]/div[1]/h2

Set Pre-Condition: Get Balance and Set Balance = 0
    Wait Until Page Contains Element    xpath=//input[@cid='w1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='w1']

    
    Wait Until Element Is Visible   xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]     timeout=30s
    ${initial_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${initial_text}

    ${initial_integer} =    Convert To Integer    ${initial_text}
    # ${difference} =    Evaluate    ${initial_maximum_balance} - ${initial_integer}


    Run Keyword If    ${initial_integer} > 0 
    ...    Input Text    xpath=//input[@cid='w1']    ${initial_integer}
    # Click Button    xpath=//button[@cid='wc']
    Sleep    ${wait_time}


    Run Keyword If    ${initial_integer} > 0 
    ...    Click Button    xpath=//button[@cid='wc']
    Sleep    ${wait_time_mid}


     
    Wait Until Page Contains Element    xpath=//input[@cid='w1']     timeout=30s 
    Wait Until Page Contains Element  xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    Wait Until Element Is Visible   xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    ${new_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${new_text} 
    Sleep    ${wait_time} 

    
    Should Be Equal As Strings    ${new_text}    0
    Sleep    ${wait_time} 
    



Set Pre-Condition: Deposit ${initial_maximum_balance} 
    Wait Until Page Contains Element    xpath=//input[@cid='d1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='d1']

    Wait Until Element Is Visible     xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    ${initial_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${initial_text}

    Input Text    xpath=//input[@cid='d1']    ${initial_maximum_balance} 
    Click Button    xpath=//button[@cid='dc']
    Sleep    ${wait_time_mid}

    # "Wait For Reload Component"
    Wait Until Page Contains Element     xpath=//input[@cid='d1']     timeout=30s
    Wait Until Page Contains Element      xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    Wait Until Element Is Visible      xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    ${new_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${new_text} 
    Sleep    ${wait_time} 
    
    
    Should Not Be Equal As Strings    ${new_text}    ${initial_text}
    Sleep    ${wait_time}           





ทดสอบการ login ที่ผ่าน และโอนเงินที่ไม่ผ่าน (Try Transfer Empty AccountID and Amount)
    Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='t1']
    Clear Element Text    xpath=//input[@cid='t2']

    # Input Text    xpath=//input[@cid='d1']    0
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}


     Wait Until Element Is Visible    xpath=//input[@cid='t1'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    # ${error_message}    Execute JavaScript    return document.querySelector('input#among:invalid').validationMessage
    ${error_message}    Execute JavaScript    return document.querySelector('input[cid="t1"]:invalid').validationMessage
    Should Contain    ${error_message}    Please fill out this field.
    Sleep    ${wait_time}


ทดสอบการ login ที่ผ่าน และโอนเงินที่ไม่ผ่าน (Try Transfer With Some AccountID and Empty Amount)
    Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='t1']
    Clear Element Text    xpath=//input[@cid='t2']

    Input Text    xpath=//input[@cid='t1']    1234567891
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}


     Wait Until Element Is Visible    xpath=//input[@cid='t2'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    # ${error_message}    Execute JavaScript    return document.querySelector('input#among:invalid').validationMessage
    ${error_message}    Execute JavaScript    return document.querySelector('input[cid="t2"]:invalid').validationMessage
    Should Contain    ${error_message}    Please fill out this field.
    Sleep    ${wait_time}


ทดสอบการ login ที่ผ่าน และโอนเงินที่ไม่ผ่าน (Try Transfer With Empty AccountID and Some Amount)
    Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='t1']
    Clear Element Text    xpath=//input[@cid='t2']

    Input Text    xpath=//input[@cid='t2']    5000
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}


     Wait Until Element Is Visible    xpath=//input[@cid='t1'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    # ${error_message}    Execute JavaScript    return document.querySelector('input#among:invalid').validationMessage
    ${error_message}    Execute JavaScript    return document.querySelector('input[cid="t1"]:invalid').validationMessage
    Should Contain    ${error_message}    Please fill out this field.
    Sleep    ${wait_time}




ทดสอบการ login ที่ผ่าน และโอนเงินที่ไม่ผ่าน (Try Transfer Wrong Format AccountID)
    Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='t1']
    Clear Element Text    xpath=//input[@cid='t2']



     Input Text    xpath=//input[@cid='t1']    A234567890
     Input Text    xpath=//input[@cid='t2']    5000
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}

      Wait Until Element Is Visible    xpath=//label[@cid='transfer-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='transfer-error-mes']
    Should Contain    ${error_message}    Please put accountId only number
    Sleep    ${wait_time}  





ทดสอบการ login ที่ผ่าน และโอนเงินที่ไม่ผ่าน (Try Transfer Wrong Format Amount )
    Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='t1']
    Clear Element Text    xpath=//input[@cid='t2']



     Input Text    xpath=//input[@cid='t1']    1234567890
     Input Text    xpath=//input[@cid='t2']    e12345
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}

      Wait Until Element Is Visible    xpath=//input[@cid='t2'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    # ${error_message}    Execute JavaScript    return document.querySelector('input#among:invalid').validationMessage
    ${error_message}    Execute JavaScript    return document.querySelector('input[cid="t2"]:invalid').validationMessage
    Should Contain    ${error_message}    Please enter a number.
    Sleep    ${wait_time}


ทดสอบการ login ที่ผ่าน และโอนเงินที่ไม่ผ่าน (Try Transfer with -1)
    Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='t1']
    Clear Element Text    xpath=//input[@cid='t2']



     Input Text    xpath=//input[@cid='t1']    9876543210
     Input Text    xpath=//input[@cid='t2']    -1
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}

      Wait Until Element Is Visible    xpath=//label[@cid='transfer-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='transfer-error-mes']
    Should Contain    ${error_message}    Please put only number
    Sleep    ${wait_time}  


ทดสอบการ login ที่ผ่าน และโอนเงินที่ไม่ผ่าน (Try Transfer to Not Exists AccountID)
    Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='t1']
    Clear Element Text    xpath=//input[@cid='t2']



     Input Text    xpath=//input[@cid='t1']    9876543210
     Input Text    xpath=//input[@cid='t2']    5000
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}

      Wait Until Element Is Visible    xpath=//label[@cid='transfer-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='transfer-error-mes']
    Should Contain    ${error_message}    Not found your target account Id
    Sleep    ${wait_time}  





ทดสอบการ login ที่ผ่าน และโอนเงินที่ไม่ผ่าน (Try Transfer to Same Account)
    Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='t1']
    Clear Element Text    xpath=//input[@cid='t2']



     Input Text    xpath=//input[@cid='t1']    1234567890
     Input Text    xpath=//input[@cid='t2']    5000
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}

      Wait Until Element Is Visible    xpath=//label[@cid='transfer-error-mes']
    ${error_message} =    Get Text    xpath=//label[@cid='transfer-error-mes']
    Should Contain    ${error_message}    Cannot transfer to your own id
    Sleep    ${wait_time}  


ทดสอบการ login ที่ผ่าน และโอนเงินที่ผ่าน (Try Transfer to Correct Account)
    Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='t1']
    Clear Element Text    xpath=//input[@cid='t2']

    
    Wait Until Page Contains Element   xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]     timeout=30s
    ${initial_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${initial_text}


    Input Text    xpath=//input[@cid='t1']    1234567899
    Input Text    xpath=//input[@cid='t2']    5000
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}

    Scroll Element Into View    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Sleep    ${wait_time} 
    # Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s 
    Wait Until Page Contains Element      xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    ${new_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${new_text} 
    Sleep    ${wait_time} 

    
    Should Not Be Equal As Strings    ${new_text}    ${initial_text}
    



Set Pre-Condition: Get Balance and Set Balance = 0
    Wait Until Page Contains Element    xpath=//input[@cid='w1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='w1']

    Wait Until Page Contains Element      xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    Wait Until Element Is Visible   xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]     timeout=30s
    ${initial_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${initial_text}

    ${initial_integer} =    Convert To Integer    ${initial_text}
    # ${difference} =    Evaluate    ${initial_maximum_balance} - ${initial_integer}


    Run Keyword If    ${initial_integer} > 0 
    ...    Input Text    xpath=//input[@cid='w1']    ${initial_integer}
    # Click Button    xpath=//button[@cid='wc']
    Sleep    ${wait_time}


    Run Keyword If    ${initial_integer} > 0 
    ...    Click Button    xpath=//button[@cid='wc']
    Sleep    ${wait_time_mid}


     
    Wait Until Page Contains Element    xpath=//input[@cid='w1']     timeout=30s 
    Wait Until Page Contains Element      xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    Wait Until Element Is Visible   xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    ${new_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${new_text} 
    Sleep    ${wait_time} 

    
    Should Be Equal As Strings    ${new_text}    0
    Sleep    ${wait_time} 
    

ทดสอบการ login ที่ผ่าน และฝากเงินที่ผ่าน (Try Deposit With Max Bigint : 18446744073709551615)
    Wait Until Page Contains Element    xpath=//input[@cid='d1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='d1']


    ${initial_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${initial_text}

    Input Text    xpath=//input[@cid='d1']    18446744073709551615
    Click Button    xpath=//button[@cid='dc']
    Sleep    ${wait_time_mid}

    # "Wait For Reload Component"
    Wait Until Page Contains Element    xpath=//input[@cid='d1']     timeout=30s
    Wait Until Page Contains Element      xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    Wait Until Element Is Visible      xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    ${new_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${new_text} 
    Sleep    ${wait_time} 
    
    # ${initial_text_integer} =    Convert To Integer    ${initial_text}
    # ${expected_text_integer} =    Evaluate    ${initial_text_integer}+18446744073709551615
    # ${new_text_integer} =    Convert To Integer    ${new_text}

    # #  Wait Until Element Is Visible    xpath=//input[@cid='d1'][@required]  # Adjust the XPath as needed
    # # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    # # ${error_message}    Execute JavaScript    return document.querySelector('input[cid="d1"]:invalid').validationMessage
    
    # Should Be Equal As Integers   ${new_text_integer}    ${expected_text_integer}
    Sleep    ${wait_time}         


ทดสอบการ login ที่ผ่าน และโอนเงินที่ผ่าน (Try Withdraw with 18446744073709551615)
    Wait Until Page Contains Element    xpath=//input[@cid='w1']     timeout=30s
    Clear Element Text    xpath=//input[@cid='w1']

    
    Wait Until Element Is Visible   xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]     timeout=30s
    ${initial_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Log    ${initial_text}



    Input Text    xpath=//input[@cid='t1']    1234567899
    Input Text    xpath=//input[@cid='t2']    18446744073709551615
    Click Button    xpath=//button[@cid='tc']
    Sleep    ${wait_time}

    Scroll Element Into View    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Sleep    ${wait_time} 
    # Wait Until Page Contains Element    xpath=//input[@cid='t1']     timeout=30s 
    Wait Until Page Contains Element      xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    Wait Until Element Is Visible    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]    timeout=30s
    ${new_text} =    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/article/h1[3]

     ${initial_text_integer} =    Convert To Integer    ${initial_text}
    ${expected_text_integer} =    Evaluate    ${initial_text_integer}-18446744073709551615
    ${new_text_integer} =    Convert To Integer    ${new_text}

    #  Wait Until Element Is Visible    xpath=//input[@cid='d1'][@required]  # Adjust the XPath as needed
    # ${error_message}=    Get Text    xpath=//input[@id='accountId'][@required]   # Use a class name that uniquely identifies the error message element
    # ${error_message}    Execute JavaScript    return document.querySelector('input[cid="d1"]:invalid').validationMessage
    
    Should Be Equal As Integers   ${new_text_integer}    ${expected_text_integer}
    Sleep    ${wait_time} 