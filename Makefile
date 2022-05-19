OS ?= 'ubuntu'
ARCH ?= 'amd64'
VERSION ?= 'latest'

# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Common way for images building, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	echo 'y' | cp Dockerfile.template Dockerfile.${OS}.${ARCH}.${VERSION} && \
		sed -i 's/<OS>/${ARCH}\/${OS}/;s/<VERSION>/${VERSION}/' Dockerfile.${OS}.${ARCH}.${VERSION} && \
		docker build -t luckycatalex/dev_environment:${ARCH}-${OS}-${VERSION} --network=host . -f Dockerfile.${OS}.${ARCH}.${VERSION} && \
		rm -f Dockerfile.${OS}.${ARCH}.${VERSION}

run: ## Common way for images runnig, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	docker run --cap-add sys_admin --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --network=host -p 2000:2000 --rm -v $(pwd):/work_dir -it luckycatalex/dev_environment:${ARCH}-${OS}-${VERSION} bash 2>/dev/null

build-light: ## Common way for gdbserver images building, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	echo 'y' | cp Dockerfile.gdbserver.template Dockerfile.${OS}.${ARCH}.${VERSION} && \
		sed -i 's/<OS>/${ARCH}\/${OS}/;s/<VERSION>/${VERSION}/' Dockerfile.${OS}.${ARCH}.${VERSION} && \
		docker build -t luckycatalex/dev_environment_light:${ARCH}-${OS}-${VERSION} --network=host . -f Dockerfile.${OS}.${ARCH}.${VERSION} && \
		rm -f Dockerfile.${OS}.${ARCH}.${VERSION}

run-light: ## Common way for gdbserver images runnig, can be used variables: OS (ubuntu/debian), ARCH (amd64/i386/arm64v8/riscv64/...), VERSION (18.04/22.04/11/10/latest/...)
	docker run --cap-add sys_admin --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --network=host -p 2000:2000 --rm -v $(pwd):/work_dir -it luckycatalex/dev_environment_light:${ARCH}-${OS}-${VERSION} bash 2>/dev/null
