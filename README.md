# Raspberry Pi Alpine Tools for Docker

This is a Docker image which is built to run on ARM devices such as the Raspberry Pi.

It inclues the following extra tools, mainly for diagnostic and troubleshooting purposes.

* bash shell
* htop
* dig / bind-tools
* iputils like ping
* curl
* wget

## Usage examples

### Docker

* `docker run shoganator/rpi-alpine-tools "dig duckduckgo.com"`
* `docker run shoganator/rpi-alpine-tools "curl -i https://duckduckgo.com"`

### Kubernetes

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: rpitools
spec:
  selector:
    matchLabels:
      app: rpitools
  template:
    metadata:
      labels:
        app: rpitools
    spec:
      containers:
      - name: rpitools
        image: shoganator/rpi-alpine-tools
        command: ["bash", "-c", "--"]
        args: ["while true; do sleep 30; done;"]
```

## Building

To build with docker, use the included build script (but remove the push commands, or replace with your own Docker Registry repo). Pass in a SemVer number to the `build.sh` script.

* `./build.sh 1.0.2`