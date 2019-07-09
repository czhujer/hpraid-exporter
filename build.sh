#!/bin/bash
export GOROOT=/usr/local/go
export GOPATH=$(pwd)
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export PATH="$PATH:/usr/local/go/bin"
export GOPATH=~/goroot


## build without debug information
go build -ldflags "-w -s" -o hpraid_exporter
