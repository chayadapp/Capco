*** Setting ***
Resource          ../Resources/testdata.resource
Resource          ../Keywords/Calculate_Exchange_Rate_API_Keywords.robot
Library           BuiltIn
Library           String
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

*** Test Cases ***
Verify result in case input correct source currency destination currency and correct amount in request body
    Set Body Calculate Exchange Rate API    ${source_currency_thb}    ${destination_currency_usd}    ${amount_int}
    Send Request Calculate Exchange Rate API
    Validate Status Code Should Be Correct    200    ${status_code}
    Validate Response Body Should Be Correct    ${source_currency_thb}    ${destination_currency_usd}    ${amount_int}