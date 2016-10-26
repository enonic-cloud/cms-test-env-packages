# Enonic CMS Packages test environment  installation container
This container is based on this repo: https://github.com/enonic-cloud/docker-compose-enonic-cms , but there are a few changes:

 * The cms-storage container have been removed, as there should not be a need for persistant storage, and this simplified working with the cms.home folder.
 * The default version of Enonic CMS is currently set to 4.7.15.  The database used requires at least 4.7.14.  Earlier versions of the cms project are not compatible with the database used here.

## Installation

   > docker-compose up -d postgres

Starts the database.

   > docker exec cmstestenvpackages_postgres_1 /usr/local/bin/backup-restore.sh

Restores the database from file, before the rest of the CMS is started.  If the CMS had discovered an empty database, it would have created a new one.
This command takes about half a minute and produces som warnings.  These may safely be ignored.

Note: At this point, it is possible to set up a local installation in your favorite development tool with the cms project, while using this database, and a copy of cms.home from this project, to debug locally.  If you just want an installation for test, continue to bring the whole site up and running like this:

   > docker-compose up -d


This command startes the rest of the containers and connects them.  After this, the only thing left to do is index the data.  This may be done from the admin console:

http://localhost:8080/admin -> login -> System/Index Monitor -> Rebuild index (FULL)

