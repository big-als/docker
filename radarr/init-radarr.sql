CREATE DATABASE "radarr-main";

CREATE DATABASE "radarr-log";

CREATE USER radarr WITH PASSWORD 'your_password';

GRANT ALL PRIVILEGES ON DATABASE "radarr-main" TO radarr;

GRANT ALL PRIVILEGES ON DATABASE "radarr-log" TO radarr;