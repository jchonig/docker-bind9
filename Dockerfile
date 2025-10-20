FROM lsiobase/ubuntu:noble

ARG DEBIAN_FRONTEND=noninteractive

RUN \
	echo "**** install packages ****" && \
	apt-get -y update && \
	apt-get install -y --no-install-recommends \
                inotify-tools \
		bind9 \
		bind9-host \
		dnsutils && \
	echo "**** clean up ****" && \
	apt-get -y clean && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

COPY root /

EXPOSE 53/udp 53/tcp

VOLUME ["/config", "/logs"]
