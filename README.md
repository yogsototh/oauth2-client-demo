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

## Device Grant Demo

<img width="842" alt="Screenshot 2024-07-17 at 15 32 13" src="https://github.com/user-attachments/assets/3c8c148c-e0a5-430f-ac94-82b22bbeae3e">

<img width="612" alt="Screenshot 2024-07-17 at 15 32 35" src="https://github.com/user-attachments/assets/45635e34-9ae8-4592-9d86-36fc44ac2dd1">



## Utility scripts

Modify `scripts/get_refresh_token` to retrieve a refresh/access token from the CTR API. 

```bash
    ./scripts/get_refresh_token.sh CLIENT_ID CLIENT_SECRET
```

Modify `scripts/test_access_token` to use your access token to query the CTR API.

```bash
    ./scripts/test_access_token.sh ACCESS_TOKEN
```
