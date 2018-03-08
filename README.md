# 🐳 eownis/blynk-server

[![build status](https://drone.titouan.co/api/badges/eownis/docker-blynk/status.svg)](https://drone.titouan.co/eownis/docker-blynk)

[![](https://images.microbadger.com/badges/version/eownis/blynk-server.svg)](https://microbadger.com/images/eownis/blynk-server "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/eownis/blynk-server.svg)](https://microbadger.com/images/eownis/blynk-server "Get your own image badge on microbadger.com")

[Blynk Server](https://www.blynk.cc). Built by [Drone](https://drone.titouan.co/eownis/docker-blynk) and pushed to [Docker Hub](https://hub.docker.com/r/eownis/blynk-server/).

## Usage

`docker-compose.yml` :
```yaml
...
  blynk:
    image: eownis/blynk-server:latest
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
