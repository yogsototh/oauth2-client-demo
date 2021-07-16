#!/bin/bash

set -e
set -x

cd "$(git rev-parse --show-toplevel)"
cd site
http-server -p 3000
