.PHONY: all docker deploy

VERSION = 13.0.17
CHEF_SERVER = chef-server
CHEF_SERVER_MANAGE = chef-server-manage

all: docker deploy

docker:
	docker build -t chef-server:latest .
	docker build \
		--build-arg WITH_MANAGE=1 \
		-t chef-server-manage:latest .

deploy:
	docker tag chef-server:latest harbor.wongsrus.net.au/swong/$(CHEF_SERVER):latest
	docker tag chef-server:latest harbor.wongsrus.net.au/swong/$(CHEF_SERVER):$(VERSION)
	docker tag chef-server-manage:latest harbor.wongsrus.net.au/swong/$(CHEF_SERVER_MANAGE):latest
	docker tag chef-server-manage:latest harbor.wongsrus.net.au/swong/$(CHEF_SERVER_MANAGE):$(VERSION)
	docker push harbor.wongsrus.net.au/swong/$(CHEF_SERVER):latest
	docker push harbor.wongsrus.net.au/swong/$(CHEF_SERVER):$(VERSION)
	docker push harbor.wongsrus.net.au/swong/$(CHEF_SERVER_MANAGE):latest
	docker push harbor.wongsrus.net.au/swong/$(CHEF_SERVER_MANAGE):$(VERSION)

