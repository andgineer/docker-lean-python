[![Docker Automated build](https://img.shields.io/docker/image-size/andgineer/python-base)](https://hub.docker.com/r/andgineer/python-base)

# Docker Alpine Linux Lightweight Base Container for Python Applications

This Dockerfile offers a base container for Python 3 applications, 
leveraging the lightweight Alpine Linux. 

The resulting container is approximately 150MB in size.

## Usage
If you wish to use this container as the foundational layer for your Python 3 application, 
incorporate the subsequent line into your Dockerfile:

    FROM andgineer/python-base


Next, transfer your requirements.txt file into the container and install the required Python libraries:

    COPY requirements.txt requirements.txt
    RUN pip install -r requirements.txt \
        && apk del python3-dev libxslt-dev libxml2-dev \
        && rm -rf ~/.pip/cache/ \
        && rm -rf /var/cache/apk/*
    
Conclude by copying your application's files into the container. 
Adjust the working directory, user, and command as deemed appropriate.

## Example

For an illustrative Dockerfile that employs this base container for a Python application, 
refer to this [GitHub repository](https://github.com/andgineer/docker-amazon-dash-button-hack/blob/master/Dockerfile).

## Docker Hub

[andgineer/python-base](https://hub.docker.com/r/andgineer/python-base)
