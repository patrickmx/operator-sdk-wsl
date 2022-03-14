#!/usr/bin/env bash

export GOPATH="/home/wslu/go"
export GOROOT="/usr/local/go"
export PATH="$PATH:/usr/local/go/bin:/home/wslu/go/bin:$HOME/.local/bin:$HOME/bin"
cd /home/wslu/


# binary will be $(go env GOPATH)/bin/golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.36.0

golangci-lint --version
