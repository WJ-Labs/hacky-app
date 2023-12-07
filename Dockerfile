FROM --platform=amd64 python:3.11.4-slim-bullseye
COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

CMD [ "python", "/app/main.py" ]