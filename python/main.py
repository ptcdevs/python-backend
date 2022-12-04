import os
import socket
from typing import Union
from urllib import request

from fastapi import FastAPI

import uvicorn

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


@app.on_event("startup")
def startup_event():
    hostname = "TBA"

    message = "View SwaggerUI at http://{host}/docs\n"
    formatted_message = message.format(host=hostname)
    print(formatted_message)

if __name__ == "__main__":
    uvicorn.run("main:app", port=5000, host='0.0.0.0', log_level="info")