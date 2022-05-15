FROM golang:alpine as builder
RUN apk add --no-cache git
RUN go install github.com/golang/mock/mockgen@latest

FROM golang:alpine
WORKDIR /home
COPY --from=builder /go/bin/mockgen /bin/mockgen
