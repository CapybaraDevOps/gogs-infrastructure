FROM golang:1.20 AS builder

ENV GOGS_VERSION=latest

WORKDIR /home/app

RUN apt-get update && apt-get install -y \
    bash \
    ca-certificates \
    curl \
    git \
    openssh-client \
    s6 \
    passwd \
    socat \
    tzdata \
    rsync \
    libpam0g \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/gogs/gogs.git gogs

WORKDIR /home/app/gogs

RUN go build -tags "pam cert" -o gogs

FROM debian:bullseye-slim

RUN adduser --disabled-login --gecos 'Gogs' git

WORKDIR /home/app

COPY --from=builder /home/app/gogs/gogs /home/app/gogs

EXPOSE 22 3000

CMD ["./gogs", "web"]