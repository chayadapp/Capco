*** Keywords ***
Send Request Calculate Exchange Rate API
    ${header}=    Create Dictionary    Content-Type=application/json
    create session    CalculateExchageRateAPI    ${host_url}    disable_warnings=1
    ${response}    post on session    alias=CalculateExchageRateAPI   url=${exchange_rate_uri}    headers=${header}    data=${body}    expected_status=Anything
    Set Test Variable    ${status_code}    ${response.status_code}
    Set Test Variable    ${response_body}    ${response.json()}
    Log To Console    ${response_body}

Set Body Calculate Exchange Rate API
    [Arguments]    ${sourceCurrency}    ${destinationCurrency}    ${amount}
    ${body}    Create Dictionary  
    IF  '${sourceCurrency}' != '${not_send_flag}'
        Set To Dictionary    ${body}    sourceCurrency=${sourceCurrency}
    END
    IF  '${destinationCurrency}' != '${not_send_flag}'
        Set To Dictionary    ${body}    destinationCurrency=${destinationCurrency}
    END
    IF  '${amount}' != '${not_send_flag}'
        ${amount}    Convert To Integer    ${amount}
        Set To Dictionary    ${body}    amount=${amount}
    END
    ${body}=    Evaluate    json.dumps(${body})    json
    Set Test Variable    ${body}
    Log To Console    RequestBody ${body}

Validate Status Code Should Be Correct
    [Arguments]    ${expected_status_code}     ${actual_status_code}
    Should Be Equal As Integers    ${expected_status_code}     ${actual_status_code}

Validate Response Body Should Be Correct
    [Arguments]    ${expected_source_currency}    ${expected_destination_currency}    ${expected_amount}
    Set Test Variable    ${actual_source_currency}    ${response_body['sourceCurrency']}
    Set Test Variable    ${actual_destination_currency}    ${response_body['destinationCurrency']}
    Set Test Variable    ${actual_amount}    ${response_body['amount']}
    Set Test Variable    ${actual_convert_amount}    ${response_body['convertedAmount']}
    Set Test Variable    ${actual_rate}    ${response_body['rate']}
    Should Be Equal As Strings    ${expected_source_currency}     ${actual_source_currency}
    Should Be Equal As Strings    ${expected_destination_currency}     ${actual_destination_currency}
    Should Be Equal As Strings    ${expected_amount}    ${actual_amount}
    ${actual_convert_amount}    Convert To String    ${actual_convert_amount}
    Should Not Be Empty   ${actual_convert_amount}
    ${actual_rate}    Convert To String    ${actual_rate}
    Should Not Be Empty    ${actual_rate}