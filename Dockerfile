# 本体
#
# VERSION               0.0.1

#FROM      gendosu/ubuntu-ruby:2.3
#FROM      ruby:2.2.3
FROM      gendosu/ruby:2.3
FROM      gendosu/ruby:2.3

MAINTAINER Gen Takahashi "gendosu@gmail.com"

ADD . /products
WORKDIR /products

RUN chmod a+x /products/entrypoint.sh
RUN ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

