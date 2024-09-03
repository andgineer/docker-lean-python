[![Docker Automated build](https://img.shields.io/docker/image-size/andgineer/python-base)](https://hub.docker.com/r/andgineer/python-base)

# Docker Alpine Linux Lightweight Python Container with UV

Base [Docker container](https://hub.docker.com/r/andgineer/python-base) 
for Python applications, leveraging the lightweight Alpine Linux. 

The resulting container is approximately 180MB in size.

As an extremely fast Python package manager, the container uses  
[Astral's uv](https://github.com/astral-sh/uv).

It automatically creates and activates a virtual uv environment for you.
You can still use `pip`, but `uv` is significantly faster.

## Usage

To try simple example from [example/](example/):

    docker build -t python-base example/
    docker run --rm -it python-base

## Real Application Example

For an illustrative Dockerfile that employs this base container for a Python application, 
refer to this [GitHub repository](https://github.com/andgineer/docker-amazon-dash-button-hack/blob/master/Dockerfile).

## Docker Hub

[andgineer/python-base](https://hub.docker.com/r/andgineer/python-base)
