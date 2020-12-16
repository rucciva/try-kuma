# Try Kuma

- set appropriate docker host ip address in [.env](.env#L2)
- `docker-compose up -d` in root folder
- `docker-compose up -d` in `zone-1` folder
- `docker-compose up -d` in `zone-2` folder
- `docker-compose up echo_client` in `zone-2` to sent request

## Metrics

- `./k3d.sh` in `zone-management` folder
- `./install-metrics.sh` in `zone-management` after kuma control plane successfully running
