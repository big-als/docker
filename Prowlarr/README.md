# Prowlarr

Prowlarr is the indexer manager for this stack. It aggregates indexers, manages API keys, and provides search capabilities for Sonarr and Radarr.

## Purpose
- Manage torrent and usenet indexers
- Provide indexer configuration for Sonarr and Radarr
- Help maintain search providers and API credentials

## Configuration
- Service port: `9696`
- Stores config in the `prowlarr` volume
- `example.env` should be copied to `.env` and configured with your desired values
- Docker image: [linuxserver/prowlarr](https://hub.docker.com/r/linuxserver/prowlarr)

## Notes
- Add indexers and configure API credentials inside the Prowlarr UI.
- Ensure Sonarr and Radarr are pointed at Prowlarr as their indexer source if you want centralized indexer management.