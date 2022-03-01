#!/usr/bin/env bash

cd /home/wslu

wget -q https://go.dev/dl/go1.17.7.linux-amd64.tar.gz -O /home/wslu/golang.tar.gz

rm -rf /usr/local/go && tar -C /usr/local -xzf /home/wslu/golang.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
