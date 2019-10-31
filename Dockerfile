FROM golang:1.13-alpine3.10 as builder

WORKDIR /src
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags '-extldflags "-static"' -mod vendor -o hpraid-exporter .

FROM ubuntu:18.04
COPY --from=builder /src/hpraid-exporter /opt/hpraid-exporter

COPY src/ssacli-3.40-3.0_amd64.deb ssacli-3.40-3.0_amd64.deb

RUN dpkg -i ssacli-3.40-3.0_amd64.deb

ENTRYPOINT ["/opt/hpraid-exporter"]
