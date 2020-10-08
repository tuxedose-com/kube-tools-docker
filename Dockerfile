FROM alpine:3.11

RUN set -eux; \
    apk add \
        gettext \
        jq \
        curl \
        bash \
        ca-certificates; \
    apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
        yq;

COPY scripts/* /

RUN set -eux; \
    chmod +x /install.sh /entrypoint.sh; \
    /install.sh

ENTRYPOINT ["/entrypoint.sh"]
