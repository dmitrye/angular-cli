FROM node:8-alpine

LABEL authors="Alejandro Such <alejandro.such@gmail.com> , Mihai Bob <mihai.m.bob@gmail.com>, Dmitry Erman <dmitry.erman@gmail.com>"

RUN apk update \
  && apk upgrade \
  && apk add --update alpine-sdk \
  && add --no-cache bash git openssh \
  && apk add --update curl \
  && apk add --update zip \
  && apk add --update sshpass \
  && apk add --update rsync \
  && npm install -g @angular/cli@1.2.0 \
  && ng set --global packageManager=yarn \
  && apk del alpine-sdk \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clear \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd
