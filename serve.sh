#!/bin/bash

set -e
set -x

cd "$(git rev-parse --show-toplevel)"

> lighttpd.conf cat<<END
server.document-root = "$PWD/site/"
server.port = 3000
mimetype.assign = (
  ".html" => "text/html; charset=utf8", 
  ".txt" => "text/plain; charset=utf8",
  ".jpg" => "image/jpeg",
  ".png" => "image/png",
  "" => "text/html; charset=utf8" 
)
index-file.names = ( "index.html" )
END

lighttpd -D -f lighttpd.conf
