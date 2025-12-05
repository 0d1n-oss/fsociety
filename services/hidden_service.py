import socket

HOST = "0.0.0.0"
PORT = 1337

banner = b"""
fsociety internal access node

Congratulations.
You reached the hidden service.

WELCOME TO FSOCIETY.
"""

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)

while True:
    conn, addr = s.accept()
    conn.sendall(banner)
    conn.close()

