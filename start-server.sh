#!/usr/bin/env zsh

# https://github.com/derekelkins/sws
# version 0.4.2.0
# 1. Install stack: https://docs.haskellstack.org/en/stable/README/
# 2. Exec: stack install sws

sws --local \
    --no-auth site \
    --port 5443 \
    --certificate=cert/server.crt \
    --key-file=cert/server.key  \
    -X 'Content-Type: text/html; charset=utf-8'
