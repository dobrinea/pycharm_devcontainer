FROM python:3.11-slim
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    git && \
    pip install pipx && \
    pipx install poetry && \
    pipx install copier && \
    pipx install invoke && \
    pipx install pre-commit && \
    pipx ensurepath  && \
    rm -rf /var/lib/apt/lists/*

# Put Poetry on the path.
ENV PATH=/root/.local/bin:$PATH
#RUN apk add --no-cache --virtual .build-deps \
#    ca-certificates gcc postgresql-dev linux-headers musl-dev \
#    libffi-dev jpeg-dev zlib-dev
WORKDIR /usr/src/app
#COPY poetry.lock pyproject.toml /usr/src/app/
RUN poetry config virtualenvs.create false
#RUN poetry install -n--no-ansi