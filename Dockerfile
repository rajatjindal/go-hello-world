FROM golang:1.8 as builder
COPY . /go/src/github.com/rajatjindal83/go-hello-world
WORKDIR /go/src/github.com/rajatjindal83/go-hello-world/hello
RUN go build hello.go

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/github.com/rajatjindal83/go-hello-world/hello/hello .
CMD ["./hello"]

