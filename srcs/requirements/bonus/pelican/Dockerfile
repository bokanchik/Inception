# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt update

RUN apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install pelican

COPY tools/setup.sh .

COPY tools/CV.html .

RUN chmod +x ./setup.sh

CMD ["sh", "./setup.sh"]