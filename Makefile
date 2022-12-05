IMAGE=bind9
TAG=devel

all: build

build:
	docker build -t ${IMAGE}:${TAG}  .

test: build
	docker run -v ${PWD}/named:/var/named -v ${PWD}/config:/config -p 53:53 -p 53:53/udp ${IMAGE}:${TAG}

# Run the container with just a bash shell
run-bash: build
	docker run -v ${PWD}/named:/var/named  -v ${PWD}/config:/config -it --ecdntrypoint /bin/bash ${IMAGE}:${TAG}

# Start the container and run a bash shell
exec-bash: build
	docker run -v ${PWD}/named:/var/named  -v ${PWD}/config:/config -it ${IMAGE}:${TAG} /bin/bash

