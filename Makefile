.PHONY: all docker deploy

all: docker deploy

docker:
	docker build -t chef-server:latest .
	docker build \
		--build-arg WITH_MANAGE=1 \
		-t chef-server-manage:latest .

deploy:
	docker tag chef-server:latest harbor.wongsrus.net.au/swong/chef-server:latest
	docker tag chef-server-manage:latest harbor.wongsrus.net.au/swong/chef-server-manage:latest
	docker push harbor.wongsrus.net.au/swong/chef-server:latest
	docker push harbor.wongsrus.net.au/swong/chef-server-manage:latest

