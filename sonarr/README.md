# Sonarr

Sonarr is a TV series management and automation service. It monitors series, finds new episodes, and manages downloads by integrating with your download client and media library.

## Purpose
- Manage TV series libraries
- Automatically search for and import new episodes
- Keep series organized in your media library

## Configuration
- Service port: `8989`
- Uses PostgreSQL for database storage
- `compose.yaml` launches both Sonarr and PostgreSQL
- `example-config.xml` shows the required PostgreSQL settings
- `init-sonarr.sql` creates the Sonarr PostgreSQL databases and user
- Docker image: [linuxserver/sonarr](https://hub.docker.com/r/linuxserver/sonarr)
- PostgreSQL image: [postgres:14](https://hub.docker.com/_/postgres)

## Notes
- Copy `example.env` to `.env` and customize values before starting for Portainer import. The provided compose file does not automatically consume `.env`; add an `env_file` entry or use `docker compose --env-file <service>/.env` if running with Docker Compose CLI.
- Ensure PostgreSQL databases are initialized before starting Sonarr.
- The `config.xml` file in the Sonarr config folder must include your PostgreSQL credentials and database names.