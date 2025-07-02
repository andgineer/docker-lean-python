FROM alpine:3.22

ENV TZ=Europe/Belgrade

# Install system dependencies and create non-root user
RUN apk upgrade \
    && apk add --update \
      ca-certificates tzdata curl tar build-base libpcap tcpdump python3 wget py3-pip git \
      nano less libxml2 python3-dev libxslt-dev libxml2-dev bash openssl-dev libffi-dev \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && update-ca-certificates \
    && addgroup -S appgroup && adduser -S leanpython -G appgroup \
    && mkdir -p /app \
    && chown -R leanpython:appgroup /app

USER leanpython
WORKDIR /home/leanpython

# Install uv and create venv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && /home/leanpython/.local/bin/uv venv

ENV VIRTUAL_ENV=/home/leanpython/.venv
ENV PATH="/home/leanpython/.local/bin:/home/leanpython/.venv/bin:$PATH"

RUN uv --version

USER leanpython
WORKDIR /app
ENTRYPOINT [ "python" ]