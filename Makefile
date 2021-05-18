SHELL := /usr/bin/env bash

####################
## Stack Commands ##
####################
up: build-node-image
	docker-compose up -d kudos_server

up-debug: build-node-image
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

build-node-image:
	docker build -t dp_kudos/node:latest -f docker/dp-node/Dockerfile .

##################################################
## Commands for building and pushing to AWS ECR ##
##################################################

login-ecr:
#	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 419222567911.dkr.ecr.us-east-1.amazonaws.com

build-api: build-node-image
	[ '$(TAG)' != '' ]
	docker build -t dayspringpartners/kudos-server:$(TAG) -f docker/kudos-server/Dockerfile-prod .
#	docker tag dayspringpartners/kudos-api:$(TAG) 419222567911.dkr.ecr.us-east-1.amazonaws.com/udb-api:$(TAG)
#	docker tag dayspringpartners/kudos-api:$(TAG) 419222567911.dkr.ecr.us-east-1.amazonaws.com/udb-api:stage

push-api: build-api login-ecr
	[ '$(TAG)' != '' ]
#	docker push 419222567911.dkr.ecr.us-east-1.amazonaws.com/udb-api:$(TAG)
#	docker push 419222567911.dkr.ecr.us-east-1.amazonaws.com/udb-api:stage
#	docker rmi 419222567911.dkr.ecr.us-east-1.amazonaws.com/udb-api:$(TAG)
#	docker rmi 419222567911.dkr.ecr.us-east-1.amazonaws.com/udb-api:stage

#########################
## Individual Commands ##
#########################


####################################
## Commands that run in container ##
####################################
