FROM golang:1.18-alpine3.17 as builder
WORKDIR /workspace

COPY go.mod go.mod
COPY go.sum go.sum
COPY localcache/ localcache/
COPY main.go main.go

RUN go mod download

RUN go build main.go

FROM golang:1.18-alpine3.17 AS runner
WORKDIR /go/app

COPY --from=builder /workspace/main .

EXPOSE 8000

CMD ["./main"]
