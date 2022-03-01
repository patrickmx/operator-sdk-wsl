oc status
oc project testop
oc login -u developer -p developer https://api.crc.testing:6443
make generate manifests
make build run
