FROM ruby:3.2.2-alpine3.18
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN apk add -U --no-cache -t .bundle make gcc musl-dev && \
  bundle install && \
  apk del .bundle
