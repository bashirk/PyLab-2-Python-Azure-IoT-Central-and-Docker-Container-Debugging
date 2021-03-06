FROM python:3.7-alpine

RUN apk add --update alpine-sdk linux-headers boost-python3

RUN export PIP_DEFAULT_TIMEOUT=100 && \
    pip3 install --upgrade pip && pip3 install --upgrade setuptools && \
    pip3 install ptvsd azure-iot-device requests

# Add the application
ADD app /app
WORKDIR /app

ENV PYTHONUNBUFFERED=1

CMD ["python3","app.py"]

# docker run -it -p 3003:3000 --device /dev/i2c-0 --device /dev/i2c-1 --rm --privileged lab2-docker:latest 