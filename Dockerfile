FROM ubuntu:20.04

ARG TARGETARCH

COPY app "./TS3AudioBot-${TARGETARCH}" /app/

RUN mkdir -p /root/.net/TS3AudioBot/zpi4t3kq.4x5/data/plugins \
    && mv /app/YunSettings.yml /root/.net/TS3AudioBot/zpi4t3kq.4x5/data/plugins/YunSettings.yml \
    && mv /app/TS3AudioBot-* /app/TS3AudioBot \
    && chmod u+x /app/TS3AudioBot \
    && apt-get update \
    && apt-get install -y --no-install-recommends libopus-dev ffmpeg \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* 

WORKDIR /app

CMD ["/app/TS3AudioBot", "--non-interactive"]
