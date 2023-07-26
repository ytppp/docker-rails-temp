FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libvips gnupg2 curl postgresql-client

# Ensure node.js 18 is available for apt-get
ARG NODE_MAJOR=18
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# Install node and yarn
RUN apt-get update -qq && apt-get install -y nodejs && npm install -g yarn

RUN gem install bundler -v 2.4.8 && \
  bundle config set --local path vendor/bundle

WORKDIR /app