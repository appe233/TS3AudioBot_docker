 #!/bin/bash
 docker buildx build \
    --push \
    --platform linux/arm64,linux/amd64 \
    -t appe233/ts3audiobot:0.12.0 \
    -t appe233/ts3audiobot:latest \
    .
