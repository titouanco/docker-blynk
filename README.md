# 🐳 titouanco/blynk-server

[![build status](https://cd.code.titouan.co/api/badges/titouan/docker-blynk/status.svg)](https://cd.code.titouan.co/titouan/docker-blynk)

[![](https://images.microbadger.com/badges/version/titouanco/blynk-server.svg)](https://microbadger.com/images/titouanco/blynk-server "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/titouanco/blynk-server.svg)](https://microbadger.com/images/titouanco/blynk-server "Get your own image badge on microbadger.com")

[Blynk Server](https://www.blynk.cc). Built by [Drone](https://cd.code.titouan.co/titouan/docker-blynk) and pushed to [Docker Hub](https://hub.docker.com/r/titouanco/blynk-server/).

## Usage

`docker-compose.yml` :
```yaml
...
  blynk:
    image: titouanco/blynk-server:latest
    container_name: blynk
    restart: always
    ports:
      - "9443:9443"
      - "8441:8441"
      - "8080:8080"
    volumes:
      - ./blynk-server/config:/config
      - ./blynk-server/data:/data
    environment:
      - UID=1000
      - GID=1000
...
```

`server.properties` :
```
...
server.ssl.cert=/config/certs/<....crt>
server.ssl.key=/config/certs/<....key>
server.ssl.key.pass=<.. .key password ..>

data.folder=/data
logs.folder=/data/logs
...
```
