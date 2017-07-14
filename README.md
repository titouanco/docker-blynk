# Docker Blynk Server

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
      - "8443:8443"
      - "8442:8442"
      - "8441:8441"
      - "8081:8081"
      - "8082:8082"
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
```.properties
...
server.ssl.cert=/config/certs/<....crt>
server.ssl.key=/config/certs/<....key>
server.ssl.key.pass=<.. .key password ..>

data.folder=/data
logs.folder=/data/logs

enable.native.epoll.transport=true
enable.native.openssl=true
...
```
