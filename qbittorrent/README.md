# qBittorrent

qBittorrent is the torrent client in this stack. It downloads and seeds torrent files and integrates with Sonarr/Radarr for automated downloads.

## Purpose
- Handle torrent downloads
- Provide a Web UI for torrent management
- Integrate with automation services for completed torrents

## Configuration
- Uses a macvlan network for a static IP and dedicated network access
- No port mappings are defined in `compose.yaml`; access qBittorrent via the assigned static IP
- Volumes:
  - `qbittorrent:/config` for configuration and state
  - `/mnt/Media:/media` for downloaded media
- Docker image: [linuxserver/qbittorrent](https://hub.docker.com/r/linuxserver/qbittorrent)

## Notes
- Copy `example.env` to `.env` and customize the network settings, static IP, and MAC address.
- Verify your host network supports macvlan before deploying.
- Use the qBittorrent Web UI to configure download clients and paths.