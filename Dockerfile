#1st build
FROM golang:latest
WORKDIR /go/src/github.com/andygbox/docker-k8s

COPY server ./server

RUN CGO_ENABLED=0 GOOS=linux go install ./server

#2nd Stage

FROM alpine:latest
WORKDIR /app/

COPY --from=0 /go/bin/server ./binary

CMD ./binary