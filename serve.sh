#!/bin/bash
set -e

cd "$(git rev-parse --show-toplevel)"

PORT=5443

> lighttpd.conf cat<<END
server.document-root = "$PWD/site/"
server.port = $PORT
mimetype.assign = (
  ".html" => "text/html; charset=utf8", 
  ".txt" => "text/plain; charset=utf8",
  ".jpg" => "image/jpeg",
  ".png" => "image/png",
  "" => "text/html; charset=utf8" 
)
index-file.names = ( "index.html" )
END

echo
echo "Starting server: http://localhost:$PORT"
echo
lighttpd -D -f lighttpd.conf
