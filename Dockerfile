FROM alpine:3.12
MAINTAINER Weaveworks Inc <help@weave.works>
LABEL works.weave.role=system
WORKDIR /home/weave
ARG TARGETARCH
COPY ./consul-sidekick-linux-${TARGETARCH} /home/weave/consul-sidekick
ENTRYPOINT ["/home/weave/consul-sidekick"]
