# syntax=docker/dockerfile:1

FROM golang:alpine3.19

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /simple-go-app

EXPOSE 8080

CMD ["/simple-go-app"]