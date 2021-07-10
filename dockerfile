# pull official base image
ARG BASE_IMAGE=python:3.8.3-slim-buster

FROM ${BASE_IMAGE} AS requirements-image

# set working directory
WORKDIR /usr/src/app

# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# install python dependencies
RUN pip install --upgrade pip
RUN pip install pipenv pytest
COPY Pipfile* ./
RUN pipenv lock -r --dev > requirements.txt

RUN python3 -m venv /home/venv
ENV PATH="/home/venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt



FROM ${BASE_IMAGE} AS runtime-image
ENV PYTHONUNBUFFERED TRUE
COPY --from=requirements-image /home/venv /home/venv
ENV PATH="/home/venv/bin:$PATH"

WORKDIR /usr/src/app

EXPOSE 80
COPY . .
