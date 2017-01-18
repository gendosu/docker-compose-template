# 本体
#
# VERSION               0.0.1

FROM      gendosu/ruby-for-rails:2.3

MAINTAINER Gen Takahashi "gendosu@gmail.com"

ADD . /products
WORKDIR /products

RUN chmod a+x /products/entrypoint.sh
RUN ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

