Test OAuth2 Authorization Code Grant process


Code is quite minimal done in js with no lib.


## Running the Demo

If you don't want to use sws, you can use python 3.

``` python
python server.py
```

Or if you use `nix`

```
nix-shell
./serve-https.sh
```

Then open <https://localhost:5443>

## Utility scripts

Modify `scripts/get_refresh_token` to retrieve a refresh/access token from the CTR API. 

```bash
    ./scripts/get_refresh_token.sh CLIENT_ID CLIENT_SECRET
```

Modify `scripts/test_access_token` to use your access token to query the CTR API.

```bash
    ./scripts/test_access_token.sh ACCESS_TOKEN
```
