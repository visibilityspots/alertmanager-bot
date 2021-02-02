FROM golang:alpine as gobuild

RUN apk add --no-cache git; \
    go get -v github.com/metalmatze/alertmanager-bot/cmd/alertmanager-bot; exit 0

WORKDIR /go/src/github.com/metalmatze/alertmanager-bot/cmd/alertmanager-bot

RUN go build ./

FROM alpine:latest
ENV TEMPLATE_PATHS=/templates/default.tmpl
RUN apk add --no-cache ca-certificates

COPY ./default.tmpl /templates/default.tmpl
COPY --from=gobuild /go/src/github.com/metalmatze/alertmanager-bot/cmd/alertmanager-bot/alertmanager-bot /usr/bin/alertmanager-bot

ENTRYPOINT ["/usr/bin/alertmanager-bot"]
