# helm-charts

Helm charts repository for an assortment of charts which **aren't** available here:

* [Helm/Charts](https://github.com/helm/charts)
* [Bitnami/Charts](https://github.com/bitnami/charts)

## Usage

To make use of this repo we will need to add it to our repositories in Helm:

```
helm repo add henrycook https://henrycook.github.io/helm-charts/
```

We will then be able to search the repo, like so:

```
helm repo search henrycook
```

To then use a chart in the repo we can do something like so:

```
helm install example henrycook/example
```
