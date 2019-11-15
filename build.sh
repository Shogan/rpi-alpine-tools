#!/bin/sh

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"
echo $1 | grep -E -q '^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(-(0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*)?(\+[0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*)?$' || die "SemVer argument required, $1 provided"

docker build . -t rpi-alpine-tools
docker tag rpi-alpine-tools shoganator/rpi-alpine-tools:latest
docker tag rpi-alpine-tools "shoganator/rpi-alpine-tools:$1"
docker push "shoganator/rpi-alpine-tools:latest"
docker push "shoganator/rpi-alpine-tools:$1"