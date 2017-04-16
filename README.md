Docker Alpine Linux lightweight base container for Python3 applications.

To create your Python application container you should base your container
on this one (`FROM masterandrey/docker-python-base`).

Add your `pip.requirements.txt` with Python libraries list that your application
requires.

Add to `Dockerfile`:
    RUN pip install -r pip.requirements.txt \
    && apk del python3-dev libxslt-dev libxml2-dev \
    && rm -rf ~/.pip/cache/ \
    && rm -rf /var/cache/apk/*
    
And `COPY` command to copy your application into the container.
    
Also you probably should specify `USER`, `WORKDIR`, `CMD`.

See example in https://github.com/masterandrey/docker-iot-calendar
