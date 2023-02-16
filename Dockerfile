FROM golang:1.20-alpine as builder

WORKDIR /app

RUN go mod init docker-go-template

COPY main.go .

RUN go build -o main

FROM scratch

COPY --from=builder /app/main /main

ENTRYPOINT [ "/main" ]
