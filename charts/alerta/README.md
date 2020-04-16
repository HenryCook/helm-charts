# Alerta

The [Alerta](https://github.com/alerta/alerta) monitoring system is a tool used to consolidate and de-duplicate alerts from multiple sources for quick ‘at-a-glance’ visualisation. With just one system you can monitor alerts from many other monitoring tools on a single screen.

## TL;DR;

```bash
$ helm repo add henrycook https://henrycook.github.io/helm-charts/
$ helm install alerta henrycook/alerta
```

## Introduction

This chart is a [Alerta](https://github.com/alerta/docker-alerta) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Alerta requires either a Postgres or MongoDB database to function, for ease of use we will be using the [Postgres](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) Helm chart by default with the ability to use [MongoDB](https://github.com/bitnami/charts/tree/master/bitnami/mongodb) instead.

## Prerequisites

- Kubernetes 1.18+
- Helm 3.0-beta3+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `alerta`:

```bash
$ helm install alerta henrycook/alerta
```

The command deploys Alerta and Postgres on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `alerta` deployment:

```bash
$ helm delete alerta
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters of the MongoDB chart and their default values.

| Parameter                                          | Description                                                                                                                                               | Default                                                  |
|----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| `envVars`					     | Environment variables for alerta deployment                                                                                                               | `{}`                                                     |
| `postgresql.enabled`				     | Provision and use Postgres																 | `true`						    |
| `mongodb.enabled`				     | Provision and use MongoDB																 | `false`                                                  |
| `dbUrl`	    				     | Specify DB url to use, you will want to disable postgres/mongodb							  					 | `""`	                                                    |
