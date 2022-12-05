import logging
import sys

import uvicorn
import uvicorn.config

from typing import Union
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


@app.on_event("startup")
def startup_event():
    is_uvicorn = True if "uvicorn" in sys.argv[0] else False
    is_gunicorn = True if "gunicorn" in sys.argv[0] else False

    host_and_port = parse_uvicorn(sys.argv) if is_uvicorn else parse_gunicorn(sys.argv)
    swaggerui_message = "View SwaggerUI at http://{host}:{port}/docs" \
        .format(host=host_and_port[0], port=host_and_port[1])
    redoc_message = "View SwaggerUI at http://{host}:{port}/redoc" \
        .format(host=host_and_port[0], port=host_and_port[1])

    print(swaggerui_message)
    print(redoc_message)


def parse_uvicorn(sys_argv):
    host = sys_argv[sys_argv.index("--host") + 1] if "--host" in sys_argv else "127.0.0.1"
    port = sys_argv[sys_argv.index("--port") + 1] if "--port" in sys_argv else "8000"

    return [
        host,
        port
    ]


def parse_gunicorn(argv):
    # TODO: parse host and port from CLI parameters
    return {
        "TBA",
        "TBA"
    }
