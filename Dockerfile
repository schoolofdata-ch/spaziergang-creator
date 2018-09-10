FROM ruby:2.5.1-slim-stretch

RUN apt-get update -qq && apt-get install -y \
build-essential libpq-dev nodejs yarn postgresql-client

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . .

CMD [ "scripts/container_start.sh" ]

#EXPOSE 3000
