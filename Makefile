OS ?= 'ubuntu'
ARCH ?= 'amd64'
VERSION ?= 'latest'

build:
	echo 'y' | cp Dockerfile.template Dockerfile && \
		sed -i 's/<OS>/${ARCH}\/${OS}/;s/<VERSION>/${VERSION}/' Dockerfile && \
		docker build -t luckycatalex/dev_environment:${ARCH}-${VERSION} --network=host .
run:
	docker run --network=host --rm -v $(pwd):/work_dir -it luckycatalex/dev_environment:${ARCH}-${VERSION} bash
