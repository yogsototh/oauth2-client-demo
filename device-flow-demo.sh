#!/usr/bin/env zsh

SX="https://visibility.int.iroh.site"
CLIENT_ID="client-27d76a9a-3697-42f8-b492-2e21043afa92"
CLIENT_SECRET="Hkd4ihtMG2Ivr0gm7UPVgED2iyWFjNLjaC403TN7z11VKB5VyU25xg"

autoload colors && colors
eval RESET='$reset_color'

# http GET "$SX/.well-known/oauth-authorization-server" | jq '.authorization_endpoint'

red ()     { print -- "${fg[red]}$@${RESET}"; }
green ()   { print -- "${fg[green]}$@${RESET}"; }
yellow ()  { print -- "${fg[yellow]}$@${RESET}"; }
blue ()    { print -- "${fg[blue]}$@${RESET}"; }
magenta () { print -- "${fg[magenta]}$@${RESET}"; }
cyan ()    { print -- "${fg[cyan]}$@${RESET}"; }

blue " --------------------------- "
blue " OAUTH 2.0 DEVICE GRANT DEMO"
blue " --------------------------- "
echo

if (( ${+JWT} )); then
    yellow "For sake of demo, revoking my authorization for this client"
    http DELETE "$SX/iroh/oauth2/app-grant/$CLIENT_ID" Authorization:"Bearer $JWT" >/dev/null
else
    red "Don't forget to set your JWT in an environment variable"
fi

echo 
echo "Welcome to Awesome App dear user"
echo
echo "Would you like to connect your SecureX account?"
# FOR DEMO
read answer
case $answer in
  n|N|no|NO) echo "I am worthless without SecureX..."; sleep 1; echo "Guess I die now..."; echo "¯\\_(ツ)_/¯"; echo; exit 0;;
esac

da_response="$(http --form POST "$SX/iroh/oauth2/device_authorization" \
                client_id=$CLIENT_ID \
                client_secret=$CLIENT_SECRET)"
# DEBUG: echo $da_response|jq

user_code="$( echo $da_response|jq '.user_code' | sed 's/"//g')"
verification_uri="$( echo $da_response|jq '.verification_uri' | sed 's/"//g')"
verification_uri_complete="$( echo $da_response|jq '.verification_uri_complete' | sed 's/"//g')"

echo "................................................................................."
echo
yellow "Your user code is: $user_code"
echo
echo "Go there to enter it:"
echo "  $verification_uri"
echo
echo "If you are a bit lazier; just go there:"
echo "  $verification_uri_complete"
echo
echo "................................................................................."
echo

device_code="$( echo $da_response|jq '.device_code' | sed 's/"//g')"

# echo "DEVICE_CODE: $device_code"

check_tokens(){
  # echo "CHECK TOKENS: $*"
  local CLIENT_ID="$1";
  local CLIENT_SECRET="$2";
  local DEVICE_CODE="$3";
  local GRANT_TYPE="urn:ietf:params:oauth:grant-type:device_code";
  http --form -a $CLIENT_ID:$CLIENT_SECRET POST "$SX/iroh/oauth2/token" grant_type=$GRANT_TYPE device_code=$DEVICE_CODE
}

poll () {
  # echo "POLLING: $*"
  local CLIENT_ID="$1";
  local CLIENT_SECRET="$2";
  local DEVICE_CODE="$3";
  local NB_RETRY="$4";
  local WAIT_INTERVAL="$5";
  for i in $(seq $NB_RETRY); do
      pollresp=$(check_tokens $CLIENT_ID $CLIENT_SECRET $DEVICE_CODE)
      # echo $pollresp
      error="$( echo $pollresp|jq '.error' | sed 's/"//g')"
      # echo "'$error'"
      access_token="$( echo $pollresp|jq '.access_token' | sed 's/"//g')"
      if [[ "$error" == "authorization_pending" ]]; then
          case $i in
               1)  echo "Enter that code will you? I don't have all day...";;
               2)  echo "You can do it! I believe in you!";;
               3)  echo "Come on! Do it already!";;
               4)  echo "Hey, that should be easy, a baby can do it!";;
               5)  echo "How much help do you need? ENTER THE CODE: $user_code";;
               6)  echo "I'm still waiting, having an issue with your browser?";;
               7)  echo "Have you ever used a computer before?";;
               8)  echo "I guess you forgot to install DUO...";;
               9)  echo "I'm waiting for you....";;
               10) echo "Hurry up mate!";;
               11) echo "Seriously, what more do you need?";;
               12) echo "You are making everything to make me loose my temper, aren't you?";;
               13) echo "OK I can wait";;
               14) echo "Ah ha, you think I care?";;
               15) echo "No seriously! Why are you doing this to me?";;
               16) echo "Please!!!! I beg you!! ENTER THE CODE!!! Free me!";;
               17) echo "I see, you really don't care about my feelings...";;
               18) echo "I don't care, I can wait, a lot longer than you.";;
               *)  echo "I guess it shoud not take care you much longer now..."
          esac
      else
          break
      fi
      sleep $WAIT_INTERVAL
  done
}

poll $CLIENT_ID $CLIENT_SECRET $device_code 100 10

echo
case $error in
    authorization_pending) red "I waited too long..."; red "bye!" ; exit 0;;
    access_denied) red "Seriously!!! How can you do that to me???!!"; red "I though we were friends!"; red "I will not forget that!"; exit 0 ;;
    *) echo;;
esac

if (( ${+access_token} )); then
  echo "Finally!"
  echo
  echo -n "I can call SecureX API now; here is your name: "
  http GET "$SX/iroh/profile/whoami" Authorization:"Bearer $access_token"|jq '.user["user-name"]'
  echo
  echo
else
  red "I couldn't retrieve your access token :(";
fi

echo "The end of the demo"
