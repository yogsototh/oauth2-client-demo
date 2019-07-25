#!/usr/bin/env bash

name=${1:-rootCA}

echo "Generate root certificate key ${name}.key"
openssl genrsa -des3 -out ${name}.key 2048

echo "Generate new root SSL certificate: ${name}.pem"
openssl req -x509 -new -nodes -key ${name}.key -sha256 -days 1024 -out ${name}.pem

echo "You should now trust the root SSL certificate"
echo " Example: https://www.freecodecamp.org/news/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec/#step-2-trust-the-root-ssl-certificate"
