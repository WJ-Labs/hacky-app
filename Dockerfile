FROM --platform=amd64 python:3.11.4-slim-bullseye
COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

ARG APP_VERSION
ENV APP_VERSION=$APP_VERSION
CMD [ "python", "/app/main.py" ]
