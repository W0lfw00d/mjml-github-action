FROM node:alpine3.12

MAINTAINER NGTI - https://github.com/ngti/

RUN npm install -g mjml@4.9

ENV PATH $PATH:/node_modules/mjml/lib

VOLUME ["/input"]
VOLUME ["/output"]

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
