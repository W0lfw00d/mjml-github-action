FROM node:alpine3.12

MAINTAINER Maarten den Heyer - https://github.com/w0lfw00d/

RUN npm install -g mjml@4.9

ENV PATH $PATH:/node_modules/mjml/lib

VOLUME ["/input"]
VOLUME ["/output"]

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

USER w0lfw00d
