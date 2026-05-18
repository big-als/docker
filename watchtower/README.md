# Watchtower

Watchtower automatically updates running Docker containers when new images are available.

## Purpose
- Poll registries for updated images on a schedule
- Recreate containers with the new image in-place
- Remove old images after updating to keep disk usage down
- Send notifications via Pushover (or any Shoutrrr-supported provider) when updates occur

## Configuration
- No ports exposed
- Requires access to the Docker socket (`/var/run/docker.sock`)
- Docker image: [nickfedor/watchtower](https://hub.docker.com/r/nickfedor/watchtower)

### Environment variables

| Variable | Description |
|---|---|
| `TZ` | Timezone — makes the cron schedule use local time instead of UTC |
| `WATCHTOWER_SCHEDULE` | 6-field Spring cron expression (seconds minutes hours day month weekday) |
| `WATCHTOWER_CLEANUP` | Remove old images after updating (hardcoded `true`) |
| `WATCHTOWER_NOTIFICATIONS_LEVEL` | Only notify on actual updates (hardcoded `info`) |
| `WATCHTOWER_NOTIFICATIONS_HOSTNAME` | Label shown in notifications instead of the container ID |
| `WATCHTOWER_NOTIFICATION_URL` | Shoutrrr notification URL (Pushover, Slack, etc.) |

### Pushover notification URL format

```
pushover://:<app-api-token>@<user-key>?devices=<device-name>
```

- **App API token** — create an application at https://pushover.net/apps/build
- **User key** — shown on your Pushover dashboard
- **devices** — your Pushover device name; omitting it may silently fail

### Multiple notification URLs

Space-separate multiple Shoutrrr URLs in a single quoted value:

```
WATCHTOWER_NOTIFICATION_URL=pushover://:<token>@<key>?devices=<device> generic+https://kuma/api/push/xxxxxxxx?status=up&msg=OK
```

Set your Uptime Kuma heartbeat interval to ~25 hours when pairing with a daily schedule.

## Notes
- Copy `example.env` to `.env` and fill in your credentials before starting for Portainer import. The provided compose file does not automatically consume `.env`; add an `env_file` entry or use `docker compose --env-file watchtower/.env` if running with Docker Compose CLI.
- To exclude a container from updates, add the label `com.centurylinklabs.watchtower.enable=false` to that container.
- To trigger an immediate check on container start (in addition to the schedule), set `WATCHTOWER_UPDATE_ON_START=true`.
