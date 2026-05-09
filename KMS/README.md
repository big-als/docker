# KMS

This stack includes a KMS server and a GUI for Windows/Office activation management.

## Purpose
- Run a KMS activation server on the local network
- Provide a web-based GUI for managing the KMS service

## Configuration
- KMS service port: `1688`
- GUI service port: `3000`
- Uses a shared volume `var` for persistent KMS state
- Docker images: [11notes/kms](https://hub.docker.com/r/11notes/kms) and [11notes/kms-gui](https://hub.docker.com/r/11notes/kms-gui)

## Notes
- There is no `example.env` in this folder, so configuration is limited to Docker Compose settings.
- Ensure your network clients are configured to use the KMS server address.