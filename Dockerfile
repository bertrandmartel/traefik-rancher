FROM traefik:v1.7-alpine
COPY traefik.toml /etc/traefik/traefik.toml
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
