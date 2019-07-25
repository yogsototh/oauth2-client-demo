#!/usr/bin/env bash

if (( $# == 0 )); then
    echo "Please provide a root certificate name you trust as first parameter"
    echo "For example: $0 rootCA"
    exit 1
fi

rootca=$1

echo "Create certificate key for localhost: server.key"
openssl req -new -sha256 -nodes -out server.csr \
  -newkey rsa:2048 \
  -keyout server.key \
  -config server.csr.cnf

echo "Create SSL certificate for localhost: server.crt"
openssl x509 -req \
        -in server.csr \
        -CA $rootca.pem \
        -CAkey $rootca.key \
        -CAcreateserial \
        -out server.crt \
        -days 500 \
        -sha256 \
        -extfile v3.ext
