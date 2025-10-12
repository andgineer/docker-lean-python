[![Docker Automated build](https://img.shields.io/docker/image-size/andgineer/lean-python)](https://hub.docker.com/r/andgineer/lean-python)

# Docker Lightweight Python Container with UV

Extremely small [Docker Container](https://hub.docker.com/r/andgineer/lean-python), based on Alpine Linux. 

Includes the high-speed [Astral uv](https://github.com/astral-sh/uv) Python package manager.

It automatically creates and activates a uv virtual environment for you.
You can still use `pip`, but `uv` is significantly faster.

The image creates and sets as default a non-root user `leanpython`, 
following security best practices of not running containers as root.

## Usage

To try the simple example from [example/](example/):

    docker build -t lean-python-example example/
    docker run --rm -it lean-python-example

### Using this image as a base

To use this container as a foundation for your Docker applications 
that require Python, add the following line to your Dockerfile:

    FROM andgineer/lean-python

Install your dependencies:

    COPY requirements.docker.txt requirements.docker.txt
    RUN uv pip install --no-cache-dir -r requirements.docker.txt

Copy your application files:

    COPY src/. .
    CMD ["my_script.py"]

Note:
- The base image already sets `WORKDIR` to `/app`
- The base image sets `ENTRYPOINT` to `python`
- When using `COPY src/. .`, all files from `src/` will be copied directly to `/app/`

As a result, the container will automatically run `my_script.py` when launched with

    docker run -it --rm my_image

### Using Root User

If you need root access, use the `USER` statement in your Dockerfile:

```dockerfile
FROM andgineer/lean-python
USER root
...
# optionally switch back to leanpython user
USER leanpython
...
```

### Real Application Example

For a real-world example using this base image, see this [Dockerfile](https://github.com/andgineer/docker-amazon-dash-button-hack/blob/master/Dockerfile).

## Docker Hub

[andgineer/lean-python](https://hub.docker.com/r/andgineer/lean-python)

### Tags

* `latest` - latest Alpine Linux with the default Python inside
* `3.X.Y` - Python 3.X.Y (like 3.12.9)
* `3.X` - Python 3.X (like 3.12) with the latest Alpine Linux it was built on
* `3.X.Y-A.B.C` - Python 3.X.Y with specific Alpine Linux A.B.C (like 3.12.9-3.20.5)
* `3.X.Y-A.B` - Python 3.X.Y with specific Alpine Linux A.B (like 3.12.9-3.20)
* `3.X-A.B` - Python 3.X with specific Alpine Linux A.B (like 3.12-3.20)

