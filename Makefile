#!make

venv-terminal:
	source ./venv/bin/activate

requirements:
	pip install -r requirements.txt

dev-run:
	uvicorn app.main:app --reload

docker-build:
	docker build -t python-backend:latest .

docker-run:
	docker run -p 8000:8000 --name python-backend-latest python-backend:latest
