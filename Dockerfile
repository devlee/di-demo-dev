FROM node

MAINTAINER devlee <devlee@outlook.com>

RUN apt-get update; \
    apt-get -y upgrade

RUN mkdir /home/git; \
    cd /home/git; \
    git clone https://github.com/devlee/di-demo-dev.git -b master

WORKDIR /home/git/di-demo-dev

RUN git submodule init; \
    git submodule update; \
    git submodule foreach git checkout master; \
    git submodule foreach git pull; \
    git submodule foreach npm install; \
    git submodule foreach npm start;

EXPOSE 6677