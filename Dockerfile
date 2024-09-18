# build: podman build . -t r2
# run: podman run -v=.:/app -it

FROM debian:latest

WORKDIR /app

RUN apt update
RUN apt install -y gcc git make
