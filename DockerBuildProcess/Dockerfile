FROM alpine

RUN apk update && apk add node.js

COPY . /app

WORKDIR /app

CMD [ "node", "index.js" ]

