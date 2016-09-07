# docker-compose-template
Dockerfile and docker-compose.yml template

Dockerfileとdocker-compose.ymlの一般的に使いそうな内容をテンプレートとして作る

### カスタマイズ

##### データベースをPostgresにする

パッケージで
pgcli libpg-devを追加

##### node使う

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash \
&&  bash -c ". /root/.nvm/nvm.sh; nvm install v5.7.0; npm install webpack -g"

