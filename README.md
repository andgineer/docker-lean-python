[![Docker Automated build](https://img.shields.io/docker/image-size/andgineer/lean-python)](https://hub.docker.com/r/andgineer/lean-python)

# Docker Lightweight Python Container with UV

Extremely small [Docker Container](https://hub.docker.com/r/andgineer/lean-python), based on Alpine Linux. 

With high-speed [Astral's uv](https://github.com/astral-sh/uv) Python package manager.

It automatically creates and activates a virtual uv environment for you.
You can still use `pip`, but `uv` is significantly faster.

## Usage

To try simple example from [example/](example/):

    docker build -t lean-python-example example/
    docker run --rm -it lean-python-example

## Real Application Example

For an illustrative Dockerfile that employs this base container for a Python application, 
refer to this [GitHub repository](https://github.com/andgineer/docker-amazon-dash-button-hack/blob/master/Dockerfile).

## Docker Hub

[andgineer/lean-python](https://hub.docker.com/r/andgineer/lean-python)

### Tags

* `latest` - latest Alpine Linux with the default Python inside
* `3.12` - Python 3.12 with the latest Alpine Linux it was built on
* `3.12-3.20` - Python 3.12 with specific Alpine Linux

