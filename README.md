# Simple Traefik image with Rancher backend

[Traefik](https://docs.traefik.io/) docker image with a default config for Rancher v1 :

* http endpoint on port 80
* https endpoint on port 443
* http redirected to https
* Rancher config (metadata)
* automatic letsencrypt SSL certificates

Original entrypoint script can be found [here](https://github.com/containous/traefik-library-image)

## Usage

```yml
version: '2'

services:
  reverse-proxy:
    image: docker.pkg.github.com/bertrandmartel/traefik-rancher/traefik-rancher:latest
    environment:
      - DOMAIN=some.domain
      - EMAIL=some@email.com
    volumes:
      - /data/acme:/acme
```
