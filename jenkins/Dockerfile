FROM golang

RUN apt-get update && apt-get install -y \
    bash \
    ca-certificates \
    curl \
    git \
    linux-pam \
    openssh-client \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY gogs /app/gogs

EXPOSE 22 3000

CMD ["./gogs", "web"]