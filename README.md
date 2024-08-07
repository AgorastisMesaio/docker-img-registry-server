# Registry Server container

![GitHub action workflow status](https://github.com/AgorastisMesaio/docker-img-registry-server/actions/workflows/docker-publish.yml/badge.svg)

This repository contains a `Dockerfile` aimed to create a *base image* to provide a dockerized Registry server.

- Start your services

```sh
docker compose up --build -d
```

## For developers

If you copy or fork this project to create your own base image.

### Building the Image

To build the Docker image, run the following command in the directory containing the Dockerfile:

```sh
docker build -t your-image/docker-img-registry-server:main .
```
