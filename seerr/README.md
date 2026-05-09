# Seerr

Seerr is the request and discovery front-end for the media stack. It allows users to request TV shows and movies, track requests, and manage approvals.

## Purpose
- Provide a UI for media requests
- Track and manage request status
- Integrate with Sonarr and Radarr for automated fulfillment

## Configuration
- Service port: `5055`
- Stores config in the `seerr` volume
- Environment variables include `LOG_LEVEL` and `TZ`
- `example.env` should be copied to `.env` and configured before deployment
- Docker image: [ghcr.io/seerr-team/seerr](https://github.com/seerr-team/seerr)

## Notes
- Use the Seerr UI to configure request sources and connect to Sonarr/Radarr.
- Keep request-related settings and API credentials up to date in Seerr.