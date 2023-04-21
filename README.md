Docker Alpine Linux lightweight base container for Python applications in less than 300M.

This Dockerfile provides a lightweight base container for Python3 applications using Alpine Linux. 

## Usage
To use this container as the base for your Python3 application, simply add the following line 
to your Dockerfile:

    Dockerfile
    Copy code
    FROM andgineer/python-base


Then, copy your requirements.txt file to the container and install the Python 
libraries your application requires with the following command:

    COPY requirements.txt requirements.txt
    RUN pip install -r requirements.txt \
        && apk del python3-dev libxslt-dev libxml2-dev \
        && rm -rf ~/.pip/cache/ \
        && rm -rf /var/cache/apk/*
    
Finally, copy your application files into the container and set the working directory, user, 
and command as necessary.

## Example

An example Dockerfile for a Python application using this base container can be found in 
this [GitHub repository](https://github.com/andgineer/docker-amazon-dash-button-hack/blob/master/Dockerfile).
