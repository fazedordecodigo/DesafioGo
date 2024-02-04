# syntax=docker/dockerfile:1

FROM golang:alpine3.19 as build

WORKDIR /go/src/app

COPY rocks.go .

RUN go build -ldflags '-s -w' rocks.go

FROM scratch

COPY --from=build /go/src/app .

CMD [ "./rocks" ]