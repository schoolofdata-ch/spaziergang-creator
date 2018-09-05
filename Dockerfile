FROM ruby:2.5.1-slim-stretch

RUN mkdir /app
WORKDIR /app

#EXPOSE 3000
#CMD ["rails", "server", "-b", "0.0.0.0"]

RUN apt-get update -qq && apt-get install -y \
    build-essential libpq-dev nodejs yarn postgresql-client

COPY Gemfile /app/
COPY Gemfile.lock /app/

RUN bundle install
RUN yarn install

COPY . /app
RUN mv /app/config/database.yml.example /app/config/database.yml
