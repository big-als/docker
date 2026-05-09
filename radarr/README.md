# Radarr

Radarr is a movie management and automation service. It monitors movie libraries, searches for new titles, and manages downloads using your configured download client and media library.

## Purpose
- Manage movie libraries
- Automatically search for and import new movie releases
- Keep movies organized in your media library

## Configuration
- Service port: `7878`
- Uses PostgreSQL for database storage
- `compose.yaml` launches both Radarr and PostgreSQL
- `example-config.xml` shows the required PostgreSQL settings
- `init-radarr.sql` creates the Radarr PostgreSQL databases and user
- Docker image: [linuxserver/radarr](https://hub.docker.com/r/linuxserver/radarr)
- PostgreSQL image: [postgres:14](https://hub.docker.com/_/postgres)

## Notes
- Copy `example.env` to `.env` and customize values before starting for Portainer import. The provided compose file does not automatically consume `.env`; add an `env_file` entry or use `docker compose --env-file <service>/.env` if running with Docker Compose CLI.
- Ensure PostgreSQL databases are initialized before starting Radarr.
- The `config.xml` file in the Radarr config folder must include your PostgreSQL credentials and database names.