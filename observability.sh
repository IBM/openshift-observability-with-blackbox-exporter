#!/bin/bash

# This script installs a basic observability stack on an Openshift cluster

if [ -z ${NAMESPACE} ]
then
    echo "You must specify a name for the namespace in the variable NAMESPACE before running the script."
    exit 1
fi
NAMESPACE=$NAMESPACE

oc new-project ${NAMESPACE}  --display-name=${NAMESPACE}

# Operator installations

sed -i -e "s/NAMESPACE/${NAMESPACE}/g" "prometheousoperator.yml"
oc apply -f prometheousoperator.yml

sed -i -e "s/NAMESPACE/${NAMESPACE}/g" "grafanaoperator.yml"
oc apply -f grafanaoperator.yml

# Custom resource creation

sed -i -e "s/NAMESPACE/${NAMESPACE}/g" "prometheuscustomresource.yml"
oc apply -f prometheuscustomresource.yml

sed -i -e "s/NAMESPACE/${NAMESPACE}/g" "grafana.yml"
oc apply -f grafana.yml

# Expose route to prometheus
oc expose service prometheus-operated

# Create role binding for blackbox exporter service account
oc adm policy add-scc-to-user anyuid -z blackbox-exporter-prometheus-blackbox-exporter