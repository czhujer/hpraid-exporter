IMAGE = registry.mallgroup.com/cc/hpraid_exporter
VERSION = 0.3

.PHONY: _
_: build publish

.PHONY: build
build:
	docker build -t $(IMAGE):$(VERSION) .

.PHONY: publish
publish:
	docker push $(IMAGE):$(VERSION)
