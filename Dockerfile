FROM elixir:latest

WORKDIR /app

COPY mix.exs mix.lock ./
RUN mix deps.get
COPY . .

RUN apt-get update && apt-get install -y build-essential inotify-tools postgresql-client

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mix archive.install hex phx_new --force




