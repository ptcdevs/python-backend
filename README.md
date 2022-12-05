# Python REST API

this project will host a backend rest api, coupled with swagger ui

## Getting started

### Setup pycharm python interpreter

Settings -> Project: `python-restapi` -> Python Interpreter

Click Add Interpreter -> Add Local Interpreter

Select New, Location `PROJECTROOT/python-restapi/venv`, Base interpreter: `/usr/bin/python3.10`

### Open new terminal

If you don't see `(venv)` at the start of your command prompt, run

  `source venv/bin/activate`

### Install pip requirements

Run`make requirements` OR `pip install -r requirements.txt`

### Run dev server

Run `make dev-run` OR `uvicorn app.main:app --reload`

### Build, run and push docker image

Using the Makefile:

    make docker-login user=YOUR_GITHUB_USER
    make docker-build
    make docker-run
    make docker-push

Alternatively:

    # login to github's docker registry
	echo ${GITHUB_TOKEN} | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin

    # build docker image
	docker build -t ghcr.io/ptcdevs/python-restapi:latest .

    # run docker image locally
	docker run -p 8000:8000 --name python-restapi-latest ghcr.io/ptcdevs/python-restapi:latest

    # push docker image
	docker push ghcr.io/ptcdevs/python-restapi:latest

## Infrastructure

See this link for terraform backend provisioning on linode (using S3 protocol):

<https://dev.to/itmecho/setting-up-linode-object-storage-as-a-terraform-backend-1ocbI>

## Reference documentation

* FastAPI: <https://fastapi.tiangolo.com/>
  * GitHub: <https://github.com/tiangolo/fastapi>
  * tutorial: <https://fastapi.tiangolo.com/tutorial/>
