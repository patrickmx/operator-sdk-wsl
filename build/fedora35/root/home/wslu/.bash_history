sudo podman login -u kubeadmin -p $(oc whoami -t) default-route-openshift-image-registry.apps-crc.testing --tls-verify=false
oc status
oc project testop
oc login -u developer -p developer https://api.crc.testing:6443
make generate manifests
make build run
