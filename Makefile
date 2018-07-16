
all: noop

install-osx:
	brew install nginx

.PHONY: install-linux
install-linux:
	sudo apt-get update && \
    sudo apt-get install -y software-properties-common && \
    sudo add-apt-repository -y ppa:nginx/stable && \
    sudo apt-get update && \
    sudo apt-get install -y --force-yes nginx-extras && \
    sudo mkdir -p /var/log/nginx

.PHONY: install-ci
install-ci: install-linux

.PHONY: start
start:
	nginx -c $$PWD/nginx.conf

.PHONY: start-ci
start-ci:
	sudo nginx -c $$PWD/nginx.conf
	# - sudo nginx -g 'user www www; daemon off;'
