FROM ruby:2.3.0

RUN apt-get update -qq
RUN apt-get install -y -qq build-essential
RUN apt-get install -y -qq nodejs
RUN apt-get install -y -qq imagemagick
RUN apt-get install -y -qq libmysqlclient-dev

ENV APP_HOME /app
ENV BUNDLE_PATH /bundle
ENV BUNDLE_JOBS 5

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME

RUN gem install bundler --no-ri --no-rdoc
