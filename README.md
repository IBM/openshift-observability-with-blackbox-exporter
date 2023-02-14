# Tutorial

To deploy the Openshift Observability stack, follow the tutorial found here: https://developer.ibm.com/tutorials/monitor-application-availability-prometheus-blackbox-exporter-grafana/

# Contents

## observability.sh
This script will handle the automated install of a basic monitoring stack on OpenShift utilizing Prometheus, Grafana, and Blackbox Exporter.

The script will do the following:

- Create a new project for your observability stack with whatever you have in the `NAMESPACE` environment variable

- Deploy the operators for Grafana and Prometheus

- Create instances of Grafana and Prometheus on your cluster


## grafanaoperator.yml and prometheusoperator.yml
These are the subscriptions for the grafana and prometheus operators, respectively. Applying these on your cluster will install both operators and make the custom resources available.

## grafana.yml and prometheuscustomresource.yml
These are the custom resources that the operators will use to create grafana and prometheus deployments.

## prometheus-job-blackbox-configuration.yaml
This is the file that Blackbox Exporter will use for configuration. This will need to be customized before it is uploaded to Openshift.
