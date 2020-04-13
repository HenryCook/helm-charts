# helm-charts

[![Actions Status](https://github.com/henrycook/helm-charts/workflows/Lint%20and%20Test%20Charts/badge.svg)](https://github.com/henrycook/helm-charts/actions)

Helm charts repository for an assortment of charts which **aren't** available here:

* [Helm/Charts](https://github.com/helm/charts)
* [Bitnami/Charts](https://github.com/bitnami/charts)

## Requirements

To make use of this repository, you will need the below tools:

* [Helm](https://helm.sh/) >= 3.0.0

## Usage

First we will need to add this to our repositories in Helm:

```
helm repo add henrycook https://henrycook.github.io/helm-charts/
```

We will then be able to search the repo, like so:

```
helm search repo henrycook
```

To then use a chart in the repo we can do something like so:

```
helm install example henrycook/example
```

## Development

For developement we will need:

* [Docker](https://www.docker.com/)

We utilise Docker for all of our tasks within the Makefile, which in turn uses official images for it's actions e.g. `chart-testing` and `helm`. The approach to utilise Docker within the `Makefile` was to make the tooling portable, and not require a list of tools to be available on the host machine.

### Packaging and Index

When adding or amending charts, please ensure your package is updated along with the index. This can be done by doing the following commands:

```
make package

make index
```

You will be prompted when raising a PR to do these things however please be aware.

### Validation and Linting

To check if your Helm chart is valid and passes linting, you may run:

```
make lint
```
