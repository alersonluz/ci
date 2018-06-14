NAME = alersonluz/ci
TAG = latest
SHELL = /bin/bash


run:
	source ./env/bin/activate && python src/main.py
install:
	virtualenv -p python3 env && source ./env/bin/activate && pip install -r src/pip-requirements.txt
docker-build:
	docker build -t $(NAME):$(TAG) .
docker-run:
	docker run -it --rm -p 5000:5000 $(NAME):$(TAG)
docker-shell:
	docker run -it --rm -p 5000:5000 $(NAME):$(TAG) $(SHELL)
docker-build-shell: docker-build docker-shell
docker-build-run: docker-build docker-run

