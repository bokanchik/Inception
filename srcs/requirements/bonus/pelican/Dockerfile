# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt update

RUN apt-get install -y \
    git \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install pelican markdown Jinja2

RUN pip install --upgrade Jinja2

COPY tools/setup.sh .

COPY tools/cv.md .

COPY tools/cv.css .

RUN chmod +x ./setup.sh

CMD ["sh", "./setup.sh"]