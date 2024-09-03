[![Docker Automated build](https://img.shields.io/docker/image-size/andgineer/python-base)](https://hub.docker.com/r/andgineer/python-base)

# Docker Alpine Linux Lightweight Base Container for Python Applications

This Dockerfile offers a base container for Python applications, 
leveraging the lightweight Alpine Linux. 

As an extremely fast Python package manager, the container uses  
[Astral's uv](https://github.com/astral-sh/uv).

It automatically creates and activates a virtual uv environment for you.
You can still use `pip`, but `uv` is significantly faster.

The resulting container is approximately 170MB in size.

## Usage

To use this container as the foundational layer for your Python application, 
see [example/](example/).

## Example

For an illustrative Dockerfile that employs this base container for a Python application, 
refer to this [GitHub repository](https://github.com/andgineer/docker-amazon-dash-button-hack/blob/master/Dockerfile).

## Docker Hub

[andgineer/python-base](https://hub.docker.com/r/andgineer/python-base)
