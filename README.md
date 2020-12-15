# try-kuma

- set appropriate docker host ip adress in [.env](.env#L2)
- `docker-compose up -d` in root folder
- `docker-compose up -d` in `zone1` folder
- `docker-compose up -d` in `zone2` folder
- `docker-compose up echo_client` in `zone2` to sent request
