FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /carshop
WORKDIR /carshop
COPY Gemfile /carshop/Gemfile
COPY Gemfile.lock /carshop/Gemfile.lock
RUN bundle install
COPY . /carshop
