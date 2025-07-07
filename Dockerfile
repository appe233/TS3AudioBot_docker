FROM mcr.microsoft.com/dotnet/aspnet:3.1

ARG TS3BOT_URL="https://github.com/Splamy/TS3AudioBot/releases/download/0.12.0/TS3AudioBot_dotnetcore3.1.zip"

COPY app /app/

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends libopus-dev ffmpeg wget unzip \
    && wget $TS3BOT_URL -O TS3AudioBot.zip \
    && unzip TS3AudioBot.zip \
    && apt-get -y purge wget unzip \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && rm -rf TS3AudioBot.zip WebInterface/ /var/lib/apt/lists/* 


ENTRYPOINT ["dotnet", "TS3AudioBot.dll"]