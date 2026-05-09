# Portainer

Portainer is a Docker management UI for monitoring and controlling your containers, volumes, networks, and stacks.

## Purpose
- Manage Docker containers and stacks through a web UI
- Monitor container status and logs
- Simplify deployment and maintenance of the stack

## Configuration
- Ports exposed:
  - `9443` for the Portainer web UI
  - `9000` for legacy UI access
  - `8000` for Edge Agent support (optional)
- Uses `portainer_data` volume for persistent state
- Mounts `/var/run/docker.sock` to manage the Docker daemon
- Docker image: [portainer/portainer-ee](https://hub.docker.com/r/portainer/portainer-ee)

## Notes
- Use the Portainer UI to deploy, update, and inspect stack services.
- Remove the `8000` mapping if you do not need Edge Agent support.