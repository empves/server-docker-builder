FROM debian:11.6-slim

RUN apt update && apt upgrade -y
RUN apt install ca-certificates -y

RUN useradd -u 1000 -ms /bin/bash serverman
COPY --chown=serverman artifact/LinuxServer /app

WORKDIR /app
USER serverman

ENTRYPOINT [ "sh", "/app/server.sh", "-log" ]
