IMAGE=weaveworks/consul-sidekick
TAGGED_IMAGE=$(IMAGE):$(shell git rev-parse --abbrev-ref HEAD)-$(shell git rev-parse --short HEAD)

TARGET_ARCHS= amd64 arm64

.PHONY: all push

all: consul-sidekick

consul-sidekick: main.go
	$(foreach arch,$(TARGET_ARCHS),GOOS=linux GOARCH=$(arch) go build -ldflags "-extldflags -linkmode=external -s -w" -o ./consul-sidekick-linux-$(arch) . ;)

push: all
	docker buildx build --push \
		$(foreach arch,$(TARGET_ARCHS),--platform=linux/$(arch)) \
		--tag=$(TAGGED_IMAGE) \
		--file=Dockerfile .
