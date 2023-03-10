# syntax=docker/dockerfile:1

FROM python:3.11.2-slim-buster

COPY . .
RUN pip3 install -r ./requirements.txt
RUN python3 -m unittest tests/*
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=80"]
