FROM hypriot/rpi-alpine

RUN apk update
RUN apk add bash htop bind-tools iputils curl wget

ENTRYPOINT [ "/bin/bash", "-c", "--" ]
