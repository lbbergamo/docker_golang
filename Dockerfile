FROM golang:1.7.3-alpine as Builder

WORKDIR /go/src/app

COPY app.go .
RUN go build app .

FROM scratch
WORKDIR /root/

COPY --from=builder /go/src/app/app .
CMD ["./app"]