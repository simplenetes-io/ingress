# TODO: change image address to correct repo
#image = ingress:fetcher-0.1
image = registry.gitlab.com/blockie/tmp-image-registry:ingress-fetcher-0.2

build:
	space /run/ -d >release/fetcher
	chmod +x release/fetcher

build-image:
	docker build -t $(image) .

push-image:
	docker push $(image)

# The buildah target is used to build specifically for podman when running locally
build-image-buildah:
	buildah build-using-dockerfile -t $(image) .

.PHONY: build build-image push-image build-image-buildah
