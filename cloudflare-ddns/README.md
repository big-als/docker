# Cloudflare DDNS

This service keeps a DNS record updated with your public IP address using Cloudflare.

## Purpose
- Automatically update Cloudflare DNS records when your IP changes
- Keep hostname mapping current for remote access

## Configuration
- Uses environment variables only; no ports are exposed
- Required values:
  - `CF_EMAIL`
  - `CF_API_TOKEN`
  - `CF_ZONE_ID`
  - `CF_RECORD_NAME`
  - `TZ`
  - `CHECK_INTERVAL`
- Docker image: [alexhorst/cloudflare-ddns](https://hub.docker.com/r/alexhorst/cloudflare-ddns)

## Notes
- Copy `example.env` to `.env` and configure the Cloudflare credentials before starting.
- Ensure the API token has permission to edit DNS records for the specified zone.