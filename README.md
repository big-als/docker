# Docker Compose Stack

A comprehensive Docker Compose setup for a self-hosted media management ecosystem. This repository contains containerized services for media organization, requesting, downloading, and streaming.

## Overview

This stack provides a complete media server solution with integrated services for:
- Media library management (Sonarr, Radarr)
- Media discovery and requesting (Seerr)
- Torrenting (qBittorrent)
- Indexer management (Prowlarr)
- Library cleanup (Cleanuparr)
- VPN/tunnel integration (Cloudflare Tunnel)
- DNS management (Cloudflare DDNS)
- KMS activation
- Container management (Portainer)

## Services

### Media Management
- **Sonarr** - TV series management and automation (port 8989)
- **Radarr** - Movie management and automation (port 7878)
- **Seerr** - Media discovery and request management (port 5055)

### Downloading & Torrenting
- **qBittorrent** - Torrent client with VPN routing
- **Prowlarr** - Centralized indexer/tracker management (port 9696)

### Maintenance
- **Cleanuparr** - Library cleanup and organization (port 11011)

### Infrastructure
- **Portainer** - Docker container management (port 9443, 9000)
- **Cloudflare Tunnel** - Secure tunneling to Cloudflare
- **Cloudflare DDNS** - Dynamic DNS for Cloudflare domains
- **KMS** - KMS server for Windows/Office activation

## Prerequisites

- Docker and Docker Compose installed
- Host paths configured:
  - `/mnt/Media` - Media library directory
  - `/mnt/docker/stacks/` - Service configuration directories
- Environment files configured for each service

## Quick Start

1. Clone this repository
2. Copy `example.env` files to `.env` in each service directory and customize values
3. Deploy individual services or the full stack:

   ```bash
   # Deploy specific service
   docker compose -f <service>/compose.yaml up -d

   # Or use Portainer UI for easier management
   ```

## Configuration

Each service folder contains an `example.env` file with all required environment variables. Copy and customize these files:

```bash
cp <service>/example.env <service>/.env
```

Key configuration points:
- Portainer variables are used for sensitive data and paths
- qBittorrent uses static IP/MAC for VPN routing
- Sonarr and Radarr use PostgreSQL databases (see PostgreSQL Setup below)
- Cloudflare services require API tokens and zone IDs

### PostgreSQL Setup

Sonarr and Radarr are configured to use PostgreSQL databases for improved performance and reliability. Each service requires two databases: a main database for configuration/history and a log database for events.

#### Database Initialization
Use the provided SQL scripts to create the required databases and users:

- **Sonarr**: Run `sonarr/init-sonarr.sql` on your PostgreSQL server
- **Radarr**: Run `radarr/init-radarr.sql` on your PostgreSQL server

These scripts create the databases (`sonarr-main`/`radarr-main` and `sonarr-log`/`radarr-log`) and grant privileges to dedicated users.

#### Application Configuration
Update the `config.xml` file in each service's config directory with PostgreSQL connection details. Example configurations are provided:

- **Sonarr**: `sonarr/example-config.xml`
- **Radarr**: `radarr/example-config.xml`

Merge the PostgreSQL settings into your existing `config.xml` and restart the services to apply changes.

## Notes

- Services use Portainer-compatible variable syntax: `${VARIABLE_NAME}`
- Database credentials should be updated to secure values
- Host paths should be verified to exist before deploying
- Some services depend on others (sonarr/radarr depend on postgres)

## File Structure

```
docker/
├── cleanuparr/
├── cloudflare-ddns/
├── cloudflare-tunnel/
├── KMS/
├── Prowlarr/
├── portainer/
├── qbittorrent/
├── radarr/
├── seerr/
└── sonarr/
```

Each service directory contains:
- `compose.yaml` - Service configuration
- `example.env` - Environment variable template