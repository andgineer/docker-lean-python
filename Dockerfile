FROM alpine:3.21

ENV TZ=Europe/Belgrade

RUN apk upgrade \
#      --no-check-certificate \
    && apk add --update \
#      --no-check-certificate \
      ca-certificates tzdata curl tar build-base libpcap tcpdump python3 wget py3-pip git \
      nano less libxml2 python3-dev libxslt-dev libxml2-dev bash openssl-dev libffi-dev \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && update-ca-certificates\
    && curl \
#         --insecure --proxy-insecure \
         -LsSf https://astral.sh/uv/install.sh | sh \
    && $HOME/.local/bin/uv venv

ENV VIRTUAL_ENV=.venv
ENV PATH="/.venv/bin:/root/.cargo/bin:${PATH}"
