*** Keywords ***
Open Capco Website
    Open Browser    ${capco_url}    chrome
    Maximize Browser Window

Accept All Cookies
    Wait Until Element Is Visible    ${accept_cookies_btn}
    Click Element    ${accept_cookies_btn}
    
Validate YouTube Video Display And Title Should Be Valid
    Wait Until Element Is Visible    ${play_video_btn}
    Click Element    ${play_video_btn}
    Wait Until Element Is Visible    ${get_capco_text}
    Log To Console    ${get_capco_text}
    ${actual_capco_text}    Get Text    ${get_capco_text}
    Log to console    ${actual_capco_text}
    Should Be Equal    ${expected_capco_video_tiltle}    ${actual_capco_text}

Validate That Page Title Display FIND OUR JOB
    Wait Until Element Is Visible    ${search_for_opportunity_btn}
    Click Element    ${search_for_opportunity_btn}
    Wait Until Element Is Visible    ${find_your_job_text}
    Log To Console    ${find_your_job_text}
    ${actual_find_your_job_text}    Get Text    ${find_your_job_text}
    Log to console    ${actual_find_your_job_text}
    Should Be Equal    ${expected_find_your_job_message}    ${actual_find_your_job_text}

Check How Many Jobs Still Open
    Wait Until Element Is Visible    ${number_of_job_found_txt}
    Log To Console    Number of job still open: ${number_of_job_found_txt}