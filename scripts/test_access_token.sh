curl -G https://visibility.amp.cisco.com/iroh/profile/whoami \
    --header "Accept: application/json" \
    --header "application/json; charset=UTF-8" \
    --header "User-Agent: ob-http" \
    --header "Authorization: Bearer $1" \