# Python backend

this project will host a backend rest api, coupled with swagger ui

## Getting started

### Setup PyCharm Python interpreter

Settings -> Project: `python-backend` -> Python Interpreter

Click Add Interpreter -> Add Local Interpreter

Select New, Location `PROJECTROOT/python-backend/venv`, Base interpreter: `/usr/bin/python3.10`

### Open new terminal

If you don't see `(venv)` at the start of your command prompt, run

  `source venv/bin/activate`

### Install pip requirements

Run`make requirements` OR `pip install -r requirements.txt`

### Run dev server

Run `make dev-run` OR `uvicorn app.main:app --reload`

## Reference documentation

* FastAPI: <https://fastapi.tiangolo.com/>
  * GitHub: <https://github.com/tiangolo/fastapi>
  * tutorial: <https://fastapi.tiangolo.com/tutorial/>
