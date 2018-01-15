FROM openjdk:8-jdk-alpine
LABEL maintainer "Titouan Condé <eownis+docker@titouan.co>"
LABEL org.label-schema.name="Blynk Server"
LABEL org.label-schema.vcs-url="https://git.titouan.co/eownis/docker-blynk"

ARG BLYNK_VERSION=0.29.7

ENV UID="991" \
    GID="991"

RUN apk add --no-cache curl runit tini \
    && mkdir /blynk \
    && curl -L https://github.com/blynkkk/blynk-server/releases/download/v${BLYNK_VERSION}/server-${BLYNK_VERSION}-java8.jar > /blynk/server.jar \
    && apk del curl

COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

# IP port listing:
# 8443: Application mutual ssl/tls port
# 8442: Hardware plain tcp/ip port
# 8441: Hardware ssl/tls port (for hardware that supports SSL/TLS sockets)
# 8081: Web socket ssl/tls port
# 8082: Web sockets plain tcp/ip port
# 9443: HTTPS port
# 8080: HTTP port
EXPOSE 8080 8081 8082 8441 8442 8443 9443
VOLUME /config /data

WORKDIR /config
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/start.sh"]
