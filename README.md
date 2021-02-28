# docker-bind9

A docker container to run ISC nameserver

# Usage

### docker-compose

Compatible with docker-compose v3 schemas.

```
---
version: "3"
services:
  bind9:
    image: jchonig/bind9
    container_name: bind9
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
	  - PATHTO/config:/config
	  - run:/var/run
	ports:
	  - 53:53
	  - 53:53/udp
    restart: unless-stopped

volumes:
  run:
```

# Parameters

## Environment Variables (-e)

| Env       | Function                                     |
| ---       | --------                                     |
| PUID=1000 | for UserID - Set to UID that will run bind9  |
| PGID=1000 | for GroupID - Set to GID that will run bind9 |
| TZ=UTC    | Specify a timezone to use EG UTC             |

## Volume Mappings (-v)

| Volume   | Function                                               |
| ------   | --------                                               |
| /config  | Configuration (normally found in /etc/bind)            |
| /var/run | A named volume can be use to persist state in this dir |

## Application setup
  + Any file in /etc/bind that does not exist in /config is make a
    symlink to /etc/bind.  This allows referencing of default
    configuration files w/o.
  + Any changes in the /config directory will cause a named to be
    reloaded.
