.PHONY: help

current_dir = $(shell pwd)

chart_testing = "v3.0.0-rc.1"
helm_version = "3.1.2"
helm_repo_url = "https://henrycook.github.io/helm-charts/"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

check_args:
	ifeq (${CHART},)
		@echo "CHART must be set"
		@exit 1
	endif

lint: ## Run Helm lint against all charts
	@echo "Running chart-testing lint against all charts"
	@docker run -v ${current_dir}:${current_dir} \
	  -w ${current_dir} \
	  quay.io/helmpack/chart-testing:${chart_testing} \
	  ct lint

package: check_args ## Create Helm chart packages
	@echo "Creating Helm chart packages"
	@docker run -v ${current_dir}:${current_dir} \
	  -w ${current_dir} \
	  alpine/helm:${helm_version} \
	  package --destination ./packages \
	  ./charts/${CHART}

index: ## Generate and merge changes into index.yaml for repository
	@echo "Generating index.yaml"
	@docker run -v ${current_dir}:${current_dir} \
	  -w ${current_dir} \
	  alpine/helm:${helm_version} \
	  repo index --url ${helm_repo_url} \
	  --merge index.yaml .
