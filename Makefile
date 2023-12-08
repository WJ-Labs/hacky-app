.PHONY: all build run test package-helm-chart publish-helm-chart


VERSION ?= v0.0.0-latest
IMAGE := wasosa/sample-app:$(VERSION)
REPO := wjlabs_helm_charts
PORT ?= 8888

all: build run test

build: Dockerfile
	docker build --build-arg APP_VERSION=$(VERSION) --tag $(IMAGE) .

run:
	docker rm --force app
	docker run --rm --tty --interactive --detach --name app --publish $(PORT):8080 $(IMAGE)

test:
	@curl localhost:$(PORT) > /dev/null 2>&1 || sleep 1
	@curl localhost:$(PORT)

package-helm-chart:
	helm package --version $(VERSION) --app-version $(VERSION) charts/sample-app

publish-helm-chart:
	helm repo add $(REPO) gs://$(REPO)
	helm gcs push --force sample-app-$(VERSION).tgz $(REPO)

publish-docker-image:
	docker push $(IMAGE)
