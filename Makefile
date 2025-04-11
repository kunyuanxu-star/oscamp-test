DOCKER_NAME ?= yjymosheng/arceos-ci
.PHONY: get docker build clean 

get:
	@sudo chown $(shell whoami):$(shell id -gn) -R .

docker: 
	@docker run --rm -it -v ${PWD}:/mnt -w /mnt ${DOCKER_NAME} bash

clean: 
	@dockre rmi ${DOCKER_NAME}

build:
	@docker build -t ${DOCKER_NAME} . 