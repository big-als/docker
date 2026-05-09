# Cloudflare Tunnel

This service runs a Cloudflare Tunnel to expose local services securely through Cloudflare.

## Purpose
- Provide a secure tunnel for remote access
- Avoid direct public exposure of local services
- Use Cloudflare infrastructure to route traffic

## Configuration
- Uses environment variable `TUNNEL_TOKEN`
- No additional ports are exposed in `compose.yaml`
- Docker image: [cloudflare/cloudflared](https://hub.docker.com/r/cloudflare/cloudflared)

## Notes
- Copy `example.env` to `.env` if available and add the tunnel token for Portainer import. The provided compose file does not automatically consume `.env`; add an `env_file` entry or use `docker compose --env-file <service>/.env` if using Docker Compose CLI.
- Ensure the Cloudflare tunnel is configured in your Cloudflare account before starting.