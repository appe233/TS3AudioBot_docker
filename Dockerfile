FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine

ARG TS3_AMD64_URL="https://github.com/Splamy/TS3AudioBot/releases/download/0.12.0/TS3AudioBot_linux_x64.tar.gz"
ARG TS3_ARM64_URL="https://github.com/Splamy/TS3AudioBot/releases/download/0.12.0/TS3AudioBot_linux_arm64.tar.gz"
ARG TARGETARCH

COPY app /app/

RUN cd /app \
    && if [ "$TARGETARCH" = "arm64" ]; then wget $TS3_ARM64_URL -O TS3AudioBot.tar.gz; else wget $TS3_AMD64_URL -O TS3AudioBot.tar.gz; fi \
    && tar -xzf TS3AudioBot.tar.gz \
    && rm -rf TS3AudioBot.tar.gz WebInterface/ \
    && chown -R root:root /app \
    && apk add opus-dev ffmpeg

# set the work dir to data, so users can properly mount their config files to this dir with -v /host/path/to/data:/data
WORKDIR /app

CMD ["dotnet", "TS3AudioBot.dll"]
