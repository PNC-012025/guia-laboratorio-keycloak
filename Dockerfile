FROM golang:1.20-alpine

RUN apk add --no-cache git && \
    go install github.com/googlecodelabs/tools/claat@latest

ENTRYPOINT ["claat"]