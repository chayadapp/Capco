*** Setting ***
Resource          ../Resources/testdata.resource
Resource          ../Keywords/Exchange_Rate_API_Keywords.robot
Library           BuiltIn
Library           String
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

*** Test Cases ***
Verify result in case input correct source currency and correct destination currency in url
    Send Request Exchange Rate API    ${source_currency_thb}    ${destination_currency_usd}
    Validate Status Code Should Be Correct    200    ${status_code}
    Validate Response Body Should Be Correct    ${source_currency_thb}    ${destination_currency_usd}