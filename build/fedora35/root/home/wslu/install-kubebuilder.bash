#!/usr/bin/env bash

export GOPATH="/home/wslu/go"
export GOROOT="/usr/local/go"
export PATH="$PATH:/usr/local/go/bin:/home/wslu/go/bin:$HOME/.local/bin:$HOME/bin"
cd /home/wslu/
mkdir -pv /home/wslu/go/bin
mkdir -pv /home/wslu/go/pkg

curl -L -o kubebuilder https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)
chmod +x kubebuilder && mv kubebuilder /usr/local/bin/

kubebuilder version

