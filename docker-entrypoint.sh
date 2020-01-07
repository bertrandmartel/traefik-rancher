#!/bin/sh
#https://github.com/containous/traefik-library-image/blob/master/alpine/entrypoint.sh
set -e

sed -i "s/DOMAIN/$DOMAIN/;s/EMAIL/$EMAIL/" /etc/traefik/traefik.toml

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- traefik "$@"
fi

# if our command is a valid Traefik subcommand, let's invoke it through Traefik instead
# (this allows for "docker run traefik version", etc)
if traefik "$1" --help >/dev/null 2>&1
then
    set -- traefik "$@"
else
    echo "= '$1' is not a Traefik command: assuming shell execution." 1>&2
fi

exec "$@"
