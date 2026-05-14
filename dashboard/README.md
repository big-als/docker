# Dashboard

Homarr is a home dashboard for navigating self-hosted services with live Docker container stats.

## Purpose
- Central navigation hub linking all services in this stack
- Live container stats (CPU, memory, running/stopped status) via Docker socket integration
- Tile-based UI configured through the web interface

## Configuration
- Service port: `7575`
- Docker image: [ghcr.io/homarr-labs/homarr](https://github.com/homarr-labs/homarr)
- Dashboard layout and service tiles are configured via the Homarr web UI and persisted in the `homarr-data` named volume

## Setup

1. Generate an encryption key and add it to your `.env`:
   ```bash
   openssl rand -hex 32
   ```
   Copy `example.env` to `.env` and set `SECRET_ENCRYPTION_KEY` to the generated value.

2. Deploy via Portainer stack import or Docker Compose CLI:
   ```bash
   docker compose -f dashboard/compose.yaml up -d
   ```

3. Open `http://<host>:7575` and configure service tiles through the UI.

4. To enable Docker container stats, add a **Docker** widget from the widget picker — it reads from the mounted Docker socket and shows all containers across every stack on the host.

## Notes
- The Docker socket is mounted read-only (`:ro`) — Homarr can read container state but cannot control containers.
- All data (config, database, icons) is stored in the `homarr-data` named volume and persists across container restarts and updates.
- `SECRET_ENCRYPTION_KEY` must be a 64-character hex string and must not change after initial setup — changing it will invalidate stored credentials.
- Copy `example.env` to `.env` and customize values before starting. The compose file loads `.env` automatically via `env_file`, resolved relative to the compose file's location.
