*** Keywords ***
Send Request Exchange Rate API
    [Arguments]    ${sourceCurrency}    ${destinationCurrency}
    Create Session    ExchangeRateAPI    ${host_url}    disable_warnings=1
    ${Get_Response}=    GET On Session    alias=ExchangeRateAPI    url=${exchange_rate_uri}/${sourceCurrency}/${destinationCurrency}    expected_status=Anything
    Set Test Variable    ${status_code}    ${Get_Response.status_code}
    Set Test Variable    ${response_body}    ${Get_Response.json()}

Validate Status Code Should Be Correct
    [Arguments]    ${expected_status_code}     ${actual_status_code}
    Should Be Equal As Integers    ${expected_status_code}     ${actual_status_code}

Validate Response Body Should Be Correct
    [Arguments]    ${expected_source_currency}    ${expected_destination_currency}
    Set Test Variable  ${actual_source_currency}    ${response_body['sourceCurrency']}
    Set Test Variable  ${actual_destination_currency}    ${response_body['destinationCurrency']}
    Set Test Variable  ${actual_rate}    ${response_body['rate']}
    Should Be Equal As Strings    ${expected_source_currency}     ${actual_source_currency}
    Should Be Equal As Strings    ${expected_destination_currency}     ${actual_destination_currency}
    ${actual_rate}    Convert To String    ${actual_rate}
    Should Not Be Empty    ${actual_rate}