FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  libvips42 \
  nodejs \
  postgresql-client 

RUN gem install bundler -v 2.4.8 && \
  bundle config set --local path vendor/bundle

WORKDIR /app