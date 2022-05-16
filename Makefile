OS ?= 'ubuntu'
ARCH ?= 'amd64'
VERSION ?= 'latest'

# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Common way for images building, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	echo 'y' | cp Dockerfile.template Dockerfile && \
		sed -i 's/<OS>/${ARCH}\/${OS}/;s/<VERSION>/${VERSION}/' Dockerfile && \
		docker build -t luckycatalex/dev_environment:${ARCH}-${VERSION} --network=host . && \
		rm -f Dockerfile

run: ## Common way for images runnig, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	docker run --network=host --rm -v $(pwd):/work_dir -it luckycatalex/dev_environment:${ARCH}-${VERSION} bash
