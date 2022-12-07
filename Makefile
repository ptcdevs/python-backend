#!make

user=ptcdevs
GITREF=`git rev-parse --abbrev-ref HEAD |  sed -e 's/\(.*\)/\L\1/'`
export
export

venv-terminal:
	@echo "source ./venv/bin/activate"

requirements:
	pip install -r requirements.txt

dev-run:
	uvicorn app.main:app --reload

docker-build:
	docker build -t ghcr.io/ptcdevs/python-restapi:${GITREF} .

docker-run:
	docker run -p 8000:8000 --name python-restapi-latest ghcr.io/ptcdevs/python-restapi:${GITREF}

docker-login:
	echo ${GITHUB_TOKEN} | docker login ghcr.io -u ${user} --password-stdin

docker-push:
	docker push ghcr.io/ptcdevs/python-restapi:${GITREF}

docker-all:	docker-login docker-build docker-push

