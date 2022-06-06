.PHONY: test

COMPOSE_FILE := docker/compose/local.yml
DOCKER_COMPOSE_CMD := docker-compose -f ${COMPOSE_FILE}
ROOT_NAME := task_management

drop-volumes:
	${DOCKER_COMPOSE_CMD} -p ${ROOT_NAME} down --volumes

build-local:
	${DOCKER_COMPOSE_CMD} -p ${ROOT_NAME} up -d --build

up:
	${DOCKER_COMPOSE_CMD} -p ${ROOT_NAME} up -d

stop-local:
	${DOCKER_COMPOSE_CMD} stop

start-local:
	${DOCKER_COMPOSE_CMD} start -d

restart-local:
	${DOCKER_COMPOSE_CMD} restart
