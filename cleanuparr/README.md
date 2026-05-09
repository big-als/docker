# Cleanuparr

Cleanuparr is a media library cleanup tool. It removes empty folders, moves or deletes unwanted files, and helps keep your media directories tidy.

## Purpose
- Clean up media library directories
- Remove empty or obsolete folders
- Improve overall media directory organization

## Configuration
- Service port: `11011`
- Uses the `cleanuparr` volume for configuration and state
- Mounts `/mnt/Media` for cleanup operations
- `example.env` should be copied to `.env` and customized before deployment
- Docker image: [ghcr.io/cleanuparr/cleanuparr](https://github.com/cleanuparr/cleanuparr)

## Notes
- Ensure cleanup paths are correct before running to avoid unintended file removal.
- The service is useful for post-processing libraries after downloads complete.