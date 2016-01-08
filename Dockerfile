# 本体
#
# VERSION               0.0.1

FROM      gendosu/ubuntu-ruby:2.2.3

MAINTAINER Gen Takahashi "gendosu@gmail.com"

RUN apt-get update \
&&  apt-get -y upgrade \
&&  apt-get -y --force-yes install \
  ttf-kochi-gothic \
  imagemagick \
  language-pack-ja \
  fonts-migmix

ENV LANG=ja_JP.UTF-8

# defaultのlocaleをja_JP.UTF-8にする
RUN update-locale LANG=ja_JP.UTF-8

# Timezone変更
RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /products
WORKDIR /products

ADD Gemfile /products/Gemfile
ADD Gemfile.lock /products/Gemfile.lock

RUN eval "$(rbenv init -)"; bundle
