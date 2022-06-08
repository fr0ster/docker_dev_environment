OS ?= 'ubuntu'
ARCH ?= 'amd64'
VERSION ?= 'latest'
R2_VERSION ?= 'master'
R2_TAG ?= 5.7.0
work_dir ?= $(shell pwd)

# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Common way for images building, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	echo 'y' | cp Dockerfile.template Dockerfile.${OS}.${ARCH}.${VERSION} && \
		sed -i 's/<OS>/${ARCH}\/${OS}/;s/<VERSION>/${VERSION}/' Dockerfile.${OS}.${ARCH}.${VERSION} && \
		docker build -t luckycatalex/dev_environment:${ARCH}-${OS}-${VERSION}-${R2_TAG} \
			--build-arg R2_VERSION=${R2_VERSION} --build-arg R2_TAG=${R2_TAG} \
			--network=host . -f Dockerfile.${OS}.${ARCH}.${VERSION} && \
		rm -f Dockerfile.${OS}.${ARCH}.${VERSION}

run: ## Common way for images runnig, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	sh -c "docker run --network=host --rm -v $(work_dir):/work_dir \
	-it luckycatalex/dev_environment:${ARCH}-${OS}-${VERSION}-${R2_TAG} bash"; echo "Exit from container"

build-light: ## Common way for gdbserver images building, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	echo 'y' | cp Dockerfile.gdbserver.template Dockerfile.${OS}.${ARCH}.${VERSION} && \
		sed -i 's/<OS>/${ARCH}\/${OS}/;s/<VERSION>/${VERSION}/' Dockerfile.${OS}.${ARCH}.${VERSION} && \
		docker build -t luckycatalex/dev_environment_light:${ARCH}-${OS}-${VERSION}-${R2_TAG} \
		--build-arg R2_VERSION=${R2_VERSION} --build-arg R2_TAG=${R2_TAG} \
		--network=host . -f Dockerfile.${OS}.${ARCH}.${VERSION} && \
		rm -f Dockerfile.${OS}.${ARCH}.${VERSION}

run-light: ## Common way for gdbserver images runnig, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	docker run --network=host --rm -v $(work_dir):/work_dir -it luckycatalex/dev_environment_light:${ARCH}-${OS}-${VERSION}-${R2_TAG} bash; echo "Exit from container"

build-nonintel: ## Common way for nonintel images building, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	echo 'y' | cp Dockerfile.nonintel.template Dockerfile.${OS}.${ARCH}.${VERSION} && \
		sed -i 's/<OS>/${ARCH}\/${OS}/;s/<VERSION>/${VERSION}/' Dockerfile.${OS}.${ARCH}.${VERSION} && \
		docker build -t luckycatalex/dev_environment_cross:${ARCH}-${OS}-${VERSION}-${R2_TAG} \
		--build-arg R2_VERSION=${R2_VERSION} --build-arg R2_TAG=${R2_TAG} \
		--network=host . -f Dockerfile.${OS}.${ARCH}.${VERSION} && \
		rm -f Dockerfile.${OS}.${ARCH}.${VERSION}

run-nonintel: ## Common way for nonintel images runnig, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	docker run --network=host --rm -v $(work_dir):/work_dir -it luckycatalex/dev_environment_cross:${ARCH}-${OS}-${VERSION}-${R2_TAG} bash; echo "Exit from container"

build-oldversion: ## Common way for old version images building, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (14.04/16.04/...)
	echo 'y' | cp Dockerfile.oldversion.template Dockerfile.${OS}.${ARCH}.${VERSION} && \
		sed -i 's/<OS>/${ARCH}\/${OS}/;s/<VERSION>/${VERSION}/' Dockerfile.${OS}.${ARCH}.${VERSION} && \
		docker build -t luckycatalex/dev_environment_oldversion:${ARCH}-${OS}-${VERSION}-${R2_TAG} \
		--build-arg R2_VERSION=${R2_VERSION} --build-arg R2_TAG=${R2_TAG} \
		--network=host . -f Dockerfile.${OS}.${ARCH}.${VERSION} && \
		rm -f Dockerfile.${OS}.${ARCH}.${VERSION}

run-oldversion: ## Common way for nonintel images runnig, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (14.04/16.04/...)
	docker run --network=host --rm -v $(work_dir):/work_dir -it luckycatalex/dev_environment_oldversion:${ARCH}-${OS}-${VERSION}-${R2_TAG} bash; echo "Exit from container"