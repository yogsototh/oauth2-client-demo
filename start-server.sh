#!/usr/bin/env zsh
sws --local --no-auth . --port 5443 --certificate=cert.pem --key-file=nopasskey.pem  -X 'Content-Type: text/html; charset=utf-8'
