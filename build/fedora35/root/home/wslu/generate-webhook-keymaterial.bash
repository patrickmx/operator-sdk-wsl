#!/usr/bin/env bash

mkdir -pv /tmp/k8s-webhook-server/serving-certs

openssl req -nodes -x509 -newkey rsa:4096 -keyout /tmp/k8s-webhook-server/serving-certs/tls.key -out /tmp/k8s-webhook-server/serving-certs/tls.crt -days 365 -s
ubj '/CN=localhost'


