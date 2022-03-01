#!/usr/bin/env bash

export GOPATH="/home/wslu/go"
export GOROOT="/usr/local/go"
export PATH="$PATH:/usr/local/go/bin:/home/wslu/go/bin:$HOME/.local/bin:$HOME/bin"
cd /home/wslu/
mkdir -pv /home/wslu/go/bin
mkdir -pv /home/wslu/go/pkg

git clone https://github.com/operator-framework/operator-sdk
cd operator-sdk
git checkout v1.17.0

go env
make install

