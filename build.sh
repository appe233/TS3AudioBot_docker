 #!/bin/bash

wget https://github.com/ZHANGTIANYAO1/TS3AudioBot-NetEaseCloudmusic-plugin/releases/download/3.0.2/TS3AudioBot_linux_x64.zip
wget https://github.com/ZHANGTIANYAO1/TS3AudioBot-NetEaseCloudmusic-plugin/releases/download/3.0.2/TS3AudioBot_linux_arm64.zip
unzip ./TS3AudioBot_linux_x64.zip && mv ./TS3AudioBot ./TS3AudioBot-amd64
unzip ./TS3AudioBot_linux_arm64.zip && mv ./TS3AudioBot ./TS3AudioBot-arm64

docker buildx build \
   --platform linux/amd64,linux/arm64 \
   --push \
   -f Dockerfile \
   -t appe233/ts3audiobot-netease:3.0.2 \
   -t appe233/ts3audiobot-netease:latest \
   .

rm -f ./TS3AudioBot*