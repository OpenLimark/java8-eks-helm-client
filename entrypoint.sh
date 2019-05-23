#!/bin/bash
set -e

export CA_CERT=$(aws eks describe-cluster --name ${CLUSTER_NAME}  --query cluster.certificateAuthority.data)
export ENDPOINT_URL=$(aws eks describe-cluster --name ${CLUSTER_NAME}  --query cluster.endpoint)
cat /k8-config.template | envsubst > /opt/kubernetes/config
export KUBECONFIG=/opt/kubernetes/config

echo "KubeConfig File: \n"
cat /opt/kubernetes/config

exec "$@"