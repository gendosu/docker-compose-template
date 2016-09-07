# 本体
#
# VERSION               0.0.1

FROM      gendosu/ubuntu-ruby:2.2.3

MAINTAINER Gen Takahashi "gendosu@gmail.com"

RUN apt-get update \
&&  apt-get -y upgrade \
&&  apt-get -y --force-yes install \
    fonts-hanazono \
    imagemagick \
    language-pack-ja \
    fonts-migmix \
    sqlite3 \
    libsqlite3-dev \
&&  apt-get clean \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN mkdir -p /products
WORKDIR /products

ADD Gemfile /products/Gemfile
# ADD Gemfile.lock /products/Gemfile.lock

RUN eval "$(rbenv init -)"; bundle
