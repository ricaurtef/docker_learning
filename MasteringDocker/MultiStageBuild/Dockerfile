FROM golang:latest as builder
WORKDIR /go-http-hello-world/
ADD https://raw.githubusercontent.com/geetarista/go-http-hello-world\
/master/hello_world/hello_world.go ./hello_world.go
RUN go env -w GO111MODULE=off \
    && go get -d -v golang.org/x/net/html \
    && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .


FROM scratch
COPY --from=builder /go-http-hello-world/app .
CMD ["./app"]
