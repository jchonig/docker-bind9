FROM lsiobase/ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

RUN \
	echo "**** install packages ****" && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		bind9 \
		bind9-host \
		dnsutils && \
	echo "**** clean up ****" && \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/*

COPY root /

EXPOSE 53/udp 53/tcp

VOLUME ["/config", "/logs"]
