Test OAuth2 Authorization Code Grant process


Code is quite minimal done in js with no lib.


## Running the Demo

If you don't want to use sws, you can use python 3.

``` python
python server.py
```

## Utility scripts

Modify `scripts/get_refresh_token` to retrieve a refresh/access token from the CTR API. 

Modify `scripts/test_access_token` to use your access token to query the CTR API.