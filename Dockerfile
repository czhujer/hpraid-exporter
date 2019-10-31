FROM golang:1.13-alpine3.10 as builder

WORKDIR /src
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags '-extldflags "-static"' -mod vendor -o hpraid-exporter .

FROM alpine:3.10
COPY --from=builder /src/hpraid-exporter /opt/hpraid-exporter

ENTRYPOINT ["/opt/hpraid-exporter"]

