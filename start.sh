#!/bin/bash

minetestserver --worldname "$MINETEST_WORLD_NAME" --port "$MINETEST_SERVER_PORT" &

python3 - <<EOF
from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Minetest server running")

HTTPServer(("0.0.0.0", 10000), Handler).serve_forever()
EOF
