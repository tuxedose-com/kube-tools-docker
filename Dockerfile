FROM alpine:3.11

RUN set -eux; \
    apk add \
        gettext \
        jq \
        curl \
        ca-certificates; \
    apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
        yq;

COPY scripts/* /
RUN /install.sh

ENTRYPOINT ["/entrypoint.sh"]
