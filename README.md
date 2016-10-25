# Enonic CMS Packages test environment  installation container
This container is based on this repo: https://github.com/enonic-cloud/docker-compose-enonic-cms
Check out the readme-file there for more details on installation, backup and other maintenance.

## Installation

   > docker-compose up -d postgres

Starts the database.

   > docker exec cmstestenvpackages_postgres_1 /usr/local/bin/backup-restore.sh

Restores the database from file, before the rest of the CMS is started.  If the CMS had discovered an empty database, it would have created a new one.
The command takes about half a minute and produces som warnings, but this may safely be ignored.

   > docker-compose up -d


This command startes the rest of the containers and connects them, to get a full system up and running.  After this, the only thing left to do is index the data.  This may be done from the admin console:
http://localhost:8080/admin -> login -> System/Index Monitor -> Rebuild index (FULL)

