FROM debian:buster-slim AS builder

ARG TERESA_CLI_VERSION=v0.34.0

RUN apt-get update \
    && apt-get install -y wget \
    && wget https://github.com/luizalabs/teresa/releases/download/${TERESA_CLI_VERSION}/teresa-linux-amd64 -O /usr/bin/teresa \
    && chmod +x /usr/bin/teresa

FROM debian:buster-slim

COPY --from=builder /usr/bin/teresa /usr/bin/teresa
