# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository provides a lightweight Docker base image (`andgineer/lean-python`) for Python applications, built on Alpine Linux with the Astral uv package manager pre-installed. The image is published to Docker Hub with multiple versioned tags.

## Architecture

### Base Image (Dockerfile)

The main Dockerfile creates a minimal Python environment with:
- **Alpine Linux 3.22** as the base
- **Non-root user**: `leanpython` (member of `appgroup`) for security
- **uv package manager**: Installed in `/home/leanpython/.local/bin` with a pre-created venv at `/home/leanpython/.venv`
- **Working directory**: `/app` (owned by leanpython user)
- **Entry point**: `python` - so CMD only needs the script name

Key environment variables:
- `VIRTUAL_ENV=/home/leanpython/.venv` - uv venv location
- `PATH` includes both uv binary directory and venv bin directory

### Image Tagging Strategy

The GitHub Actions workflow automatically generates multiple tags for each build:
- `latest` - most recent build
- `3.X.Y` - full Python version (e.g., 3.12.9)
- `3.X` - Python minor version (e.g., 3.12)
- `3.X.Y-A.B.C` - Python + full Alpine version (e.g., 3.12.9-3.20.5)
- `3.X.Y-A.B` - Python full + Alpine minor (e.g., 3.12.9-3.20)
- `3.X-A.B` - Python minor + Alpine minor (e.g., 3.12-3.20)

## Common Commands

### Building and Testing Locally

Build the base image:
```bash
docker build -t andgineer/lean-python .
```

Build and test the example:
```bash
docker build -t lean-python-example example/
docker run --rm -it lean-python-example
```

### CI/CD

The GitHub Actions workflow (`.github/workflows/dockerhub.yml`) automatically:
1. Builds the image on push to master or PR
2. Extracts Python and Alpine versions by running the built image
3. Generates multiple tags based on version combinations
4. Pushes to Docker Hub (on master branch only, not PRs)
5. Builds for both `linux/amd64` and `linux/arm64` platforms

The workflow uses GitHub Actions cache for faster builds.

## Development Notes

### When Modifying the Base Dockerfile

- The uv installation and venv creation happen as the `leanpython` user to ensure proper permissions
- System packages are installed as root before switching to `leanpython`
- The venv is activated via PATH and VIRTUAL_ENV environment variables
- Both `uv pip install` and standard `pip install` work in derived images

### Example Structure

The `example/` directory demonstrates proper usage:
- Copies `requirements.txt` and installs with `uv pip install`
- Copies application code
- Uses `CMD` with just the script name (since ENTRYPOINT is already `python`)
