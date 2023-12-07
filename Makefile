.PHONY: all build stop run test package-helm-chart publish-helm-chart

NAME := app
HELM_REPO := gs://wjlabs_helm_charts
CONTAINER_PORT := 8080
HOST_PORT ?= 8888
VERSION ?= $(shell git describe --tags)

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

package-helm-chart:
	helm package --version $(VERSION) --app-version $(VERSION) charts/sample-app

publish-helm-chart:
	gsutil cp sample-app-$(VERSION).tgz $(HELM_REPO)/
