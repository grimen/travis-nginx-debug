
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
install-ci:
	apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:nginx/stable && \
    apt-get update && \
    apt-get install -y --force-yes nginx-extras && \
    mkdir -p /var/log/nginx

.PHONY: start
start:
	nginx -c $$PWD/nginx.conf

.PHONY: start-ci
start-ci:
	nginx -c $$PWD/nginx.conf
	# sudo nginx -c $PWD/nginx.conf
	# - sudo nginx -g 'user www www; daemon off;'
