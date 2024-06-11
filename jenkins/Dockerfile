FROM alpine:20240606

RUN apk --no-cache add tar wget

WORKDIR /app

RUN wget https://dl.gogs.io/0.13.0/gogs_0.13.0_linux_amd64.tar.gz && \
    tar -xzf gogs_0.13.0_linux_amd64.tar.gz && \
    rm gogs_0.13.0_linux_amd64.tar.gz

EXPOSE 3000

ENV GOGS_CUSTOM=/data/gogs

CMD ["./gogs", "web"]