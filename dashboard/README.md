# Dashboard

Homarr is a home dashboard for navigating self-hosted services with live Docker container stats.

## Purpose
- Central navigation hub linking all services in this stack
- Live container stats (CPU, memory, running/stopped status) via Docker socket integration
- Tile-based UI configured through the web interface

## Configuration
- Service port: `7575`
- Docker image: [ghcr.io/ajnart/homarr](https://github.com/ajnart/homarr)
- Dashboard layout and service tiles are configured via the Homarr web UI and persisted in the `homarr-configs` named volume

## Setup

1. Copy `example.env` to `.env` and set `DASHBOARD_PORT` if you want a different port.

2. Deploy via Portainer stack import or Docker Compose CLI:
   ```bash
   docker compose --env-file dashboard/.env -f dashboard/compose.yaml up -d
   ```

3. Open `http://<host>:7575` and configure service tiles through the UI.

4. To enable Docker container stats, add a **Docker** widget from the widget picker — it reads from the mounted Docker socket and shows all containers across every stack on the host.

## Notes
- The Docker socket is mounted read-only (`:ro`) — Homarr can read container state but cannot control containers.
- Config, icons, and internal data are stored in named Docker volumes (`homarr-configs`, `homarr-icons`, `homarr-data`) and persist across container restarts and updates.
- Copy `example.env` to `.env` and customize values before starting for Portainer import. The provided compose file does not automatically consume `.env`; add an `env_file` entry or use `docker compose --env-file dashboard/.env` if running with Docker Compose CLI.
