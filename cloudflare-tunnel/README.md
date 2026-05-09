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
- Copy `example.env` to `.env` if available and add the tunnel token.
- Ensure the Cloudflare tunnel is configured in your Cloudflare account before starting.