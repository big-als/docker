CREATE DATABASE "sonarr-main";

CREATE DATABASE "sonarr-log";

CREATE USER sonarr WITH PASSWORD 'your_password';

GRANT ALL PRIVILEGES ON DATABASE "sonarr-main" TO sonarr;

GRANT ALL PRIVILEGES ON DATABASE "sonarr-log" TO sonarr;