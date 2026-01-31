#!/bin/bash
set -eux

# Minimal HTTP server on port 80 that returns 200 for any path
cat >/opt/health.py <<'PY'
from http.server import BaseHTTPRequestHandler, HTTPServer

class H(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type','text/plain')
        self.end_headers()
        self.wfile.write(b'OK')

HTTPServer(('0.0.0.0', 80), H).serve_forever()
PY

nohup python3 /opt/health.py >/var/log/health.log 2>&1 &