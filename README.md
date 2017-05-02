# Enonic CMS Packages test environment  installation container
This container is based on this repo: https://github.com/enonic-cloud/docker-compose-enonic-cms , but there are a few changes:

 * The cms-storage container have been removed, as there should not be a need for persistant storage, and this simplified working with the cms.home folder.
 * The default version of Enonic CMS is currently set to 4.7.15.  The database used requires at least 4.7.14.  Earlier versions of the cms project are not compatible with the database used here.

## Installation

First, start the database:

   > docker-compose up -d postgres

Then, restore the back-up of the packages database from file.  This command takes about half a minute and produces som warnings.  These may safely be ignored.

   > docker exec cmstestenvpackages_postgres_1 /usr/local/bin/backup-restore.sh

At this point, if you want to debug locally, it is possible to set up a local installation of the cms project in your favorite development tool.  To do so, make a copy of the cms.home directory in this project, and use the database in the current state.

WARNING: The 5432 port of Postgres is exposed, so it is available from outside the Docker environment in order to access and debug the database.

If you just want an installation for testing, continue to bring the whole site up and running like this:

   > docker-compose up -d


This command startes the rest of the containers and connects them.  After this, the only thing left to do is index the data.  This may be done from the admin console:

http://localhost:8080/admin -> login -> System/Index Monitor -> Rebuild index (FULL)

