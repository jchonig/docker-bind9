
all: build

build:
	docker build -t bind9  .

test: build
	docker run -v ${PWD}/named:/var/named -v ${PWD}/config:/config -p 53:53 -p 53:53/udp bind9

# Run the container with just a bash shell
run-bash:
	docker run -v ${PWD}/named:/var/named  -v ${PWD}/config:/config -it --ecdntrypoint /bin/bash bind9

# Start the container and run a bash shell
exec-bash:
	docker run -v ${PWD}/named:/var/named  -v ${PWD}/config:/config -it bind9 /bin/bash

