AUTH=`echo -n "$1:$2" | base64`

curl -X POST https://visibility.amp.cisco.com/iroh/oauth2/token \
    --http1.1 \
    --header "Accept: application/json" \
    --header "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
    --header "User-Agent: ob-http" \
    --header "Authorization: Basic $AUTH" \
-d "code=<CODE JWT RETURNED FROM CTR>" \
    -d "redirect_uri=https://localhost:4443/callback" \
    -d "scope=admin" \
    -d "grant_type=authorization_code"
