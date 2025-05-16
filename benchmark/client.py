from websockets.sync.client import connect
import time
import pathlib
import ssl

ssl_context = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
localhost_pem = pathlib.Path(__file__).with_name("localhost.pem")
ssl_context.load_verify_locations(localhost_pem)

def hello():
    start = time.time()
    with connect("wss://abenobashi.xyz/ws:444", ssl=ssl_context) as websocket:
        print(time.time() - start)
        for i in range(10):
            start = time.time()
            websocket.send("Hello world!")
            message = websocket.recv()
            print(time.time() - start)

hello()
