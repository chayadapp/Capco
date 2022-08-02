*** Variables ***
#API
${host_url}                    https://thawing-river-85770.herokuapp.com
${exchange_rate_uri}           /exchange-rate
${source_currency_thb}         THB
${source_currency_gbp}         GBP
${source_currency_eur}         EUR
${source_currency_jpy}         JPY
${empty_source_currency}       ${EMPTY}
${destination_currency_usd}    USD
${destination_currency_jpy}    JPY
${amount_int}                  1000
${amount_str}                  Test
${not_send_flag}               Not Send

#Frontend
${capco_url}                         https://www.capco.com/careers/capco-thailand
${expected_capco_video_tiltle}       ‘Capco. The Future. Now.
${expected_find_your_job_message}    Find your job
${maximum_wait_time}                 30s
