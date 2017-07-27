FROM blitznote/debootstrap-amd64:16.04
LABEL maintainer "Titouan Condé <eownis+docker@titouan.co>"
LABEL org.label-schema.vcs-url="https://gitlab.com/eownis/docker-blynk"

ARG TINI_VERSION=v0.15.0
ARG BLYNK_VERSION=0.26.0

ENV UID="991" \
    GID="991"

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin/tini

COPY start.sh /usr/bin/start.sh

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" >> /etc/apt/sources.list \
    && /usr/bin/get-gpg-key 0x7B2C3B0889BF5709A105D03AC2518248EEA14886 | apt-key add \
    && apt-get update \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
    && apt-get install -y oracle-java8-installer \
    && mkdir /blynk \
    && curl -L https://github.com/blynkkk/blynk-server/releases/download/v${BLYNK_VERSION}/server-${BLYNK_VERSION}.jar > /blynk/server.jar \
    && chmod +x /usr/local/bin/tini \
    && chmod +x /usr/bin/start.sh \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

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
ENTRYPOINT ["/usr/local/bin/tini", "--", "/usr/bin/start.sh"]
