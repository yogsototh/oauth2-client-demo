import http.server, ssl

server_address = ('localhost', 4443)
httpd = http.server.HTTPServer(server_address, http.server.SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket(httpd.socket,
                               server_side=True,
                               certfile='cert.pem',
                               keyfile='nopasskey.pem',
                               ssl_version=ssl.PROTOCOL_TLS)
print("serving demo on port 4443")
httpd.serve_forever()