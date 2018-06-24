# Build Geth in a stock Go builder container
FROM golang:1.10-alpine as builder
MAINTAINER fuyu0425
RUN apk add --no-cache make gcc musl-dev linux-headers git
RUN git clone https://github.com/ethereum/go-ethereum.git /go-ethereum --depth 1
RUN cd /go-ethereum && make geth swarm

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /go-ethereum/build/bin/* /usr/local/bin/

ENTRYPOINT ["geth"]

EXPOSE 8545
EXPOSE 30303
EXPOSE 8500
EXPOSE 30399
