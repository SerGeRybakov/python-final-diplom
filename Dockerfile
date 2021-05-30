FROM python:3.8.5-slim

MAINTAINER Sergey Rybakov <serge.rybakov@gmail.com>

WORKDIR /code
COPY requirements.txt .
RUN apt update -y && apt upgrade -y && apt install nano && \
    /usr/local/bin/python3 -m pip install --upgrade pip && \
    pip install psycopg2-binary && pip install -r requirements.txt && apt autoremove -y

COPY . .

ENTRYPOINT ["/bin/bash", "-c"]
