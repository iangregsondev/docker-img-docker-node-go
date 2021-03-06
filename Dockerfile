ARG DOCKER_VERSION=latest
FROM docker:${DOCKER_VERSION}

ARG COMPOSE_VERSION=
ARG DOCKER_VERSION

RUN apk add --no-cache py3-pip python3
RUN apk add --no-cache --virtual build-dependencies python3-dev libffi-dev openssl-dev gcc libc-dev make \
    && pip3 install "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}" \
    && apk del build-dependencies
