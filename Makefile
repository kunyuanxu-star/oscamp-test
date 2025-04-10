DOCKER_NAME ?= yjymosheng/arceos-ci
.PHONY: get docker 

get:
	@sudo chown $(shell whoami):$(shell id -gn) -R .

docker: 
	@docker run --rm -it -v ${PWD}:/mnt -w /mnt ${DOCKER_NAME} bash
