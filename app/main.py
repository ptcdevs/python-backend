import logging
import sys
from typing import Union

import uvicorn
from fastapi import FastAPI
from starlette.responses import JSONResponse

app = FastAPI()
logger = logging.getLogger("uvicorn")


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


@app.get(
    "/health",
    responses={
        200: {
            "content": {"application/json": {}},
            "description": "Return a json document with healthy api status.",
        },
        500: {
            "content": {"application/json": {}},
            "description": "Return a json document with unhealthy api status.",
        },
    })
def health_check(status = "healthy"):
    if status == "healthy":
        return {"status": "healthy"}
    else:
        return JSONResponse(status_code=500, content = {"status": "unhealthy"})


@app.on_event("startup")
def startup_event():
    is_uvicorn = True if "uvicorn" in sys.argv[0] else False

    host_and_port = parse_uvicorn(sys.argv) if is_uvicorn else ("127.0.0.1", "8000")
    swaggerui_message = "View SwaggerUI at http://{host}:{port}/docs" \
        .format(host=host_and_port[0], port=host_and_port[1])
    redoc_message = "View Redoc at http://{host}:{port}/redoc" \
        .format(host=host_and_port[0], port=host_and_port[1])

    logger.info(swaggerui_message)
    logger.info(redoc_message)


def parse_uvicorn(sys_argv):
    host = sys_argv[sys_argv.index("--host") + 1] if "--host" in sys_argv else "127.0.0.1"
    port = sys_argv[sys_argv.index("--port") + 1] if "--port" in sys_argv else "8000"

    return (host, port)


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
