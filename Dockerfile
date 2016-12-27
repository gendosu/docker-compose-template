# 本体
#
# VERSION               0.0.1

#FROM      gendosu/ubuntu-ruby:2.2.3
FROM      ruby:2.2.3

MAINTAINER Gen Takahashi "gendosu@gmail.com"

RUN apt-get update \
&&  apt-get -y upgrade \
&&  apt-get -y --force-yes install \
    fonts-hanazono \
    imagemagick \
    fonts-migmix \
    sqlite3 \
    libsqlite3-dev \
&&  apt-get clean \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ADD . /products
WORKDIR /products

RUN chmod a+x /products/entrypoint.sh
RUN ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

