.PHONY: all build stop run test

NAME := app
CONTAINER_PORT := 8080
HOST_PORT ?= 8888

all: build stop run test

build: Dockerfile
	docker build --tag $(NAME) .

stop:
	docker rm --force $(NAME)

run:
	docker run --rm --tty --interactive --detach --name $(NAME) --env APP_VERSION=1 --publish $(HOST_PORT):$(CONTAINER_PORT) $(NAME)

test:
	@curl localhost:$(HOST_PORT) > /dev/null 2>&1 || sleep 1
	@curl localhost:$(HOST_PORT)
