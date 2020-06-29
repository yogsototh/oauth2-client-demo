#!/usr/bin/env bash
# used for local dev without https need

sws --local --no-auth site --port 3001 -X 'Content-Type: text/html; charset=utf-8'
