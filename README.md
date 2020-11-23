# Import table from Postgres to Elasticsearch

### Intro:
Importing data to you Elasticsearch database is sometimes a complicated task. Instead of setting up Logstash and configuring your data import yourself, here is a Docker image you can easily use - just provide the environment variables and run it.

### About:
This tools allows you to easily import a table from Postgres DB to an Elasticsearch index (new or existing). This Docker image will setup Logstash that will connect to the Postgres instance, read all the rows from the table and load it to the Elasticsearch index. When the operation is done, the Docker container will stop.

### Usage:
The Docker image: `omril/logstash-postgres`. This is a public image stored in Dockerhub.

All information required is provided by environment variables:
* `PGHOST` - Host address of the Postgres instance
* `PGDATABASE` - Postgres database name (source)
* `PGUSER` - Postgres user name
* `PGPASSWORD` - Postgres user password
* `TABLE_NAME` - Table name in the Postgres database to copy
* `ES_HOST` - Host address of Elasticsearch
* `ES_USER` - Elasticsearch user name
* `ES_PASSWORD` - Elasticsearch user password
* `ES_INDEX` - Elasticsearch destination index

### Example:
1. Pull the docker image: 

```bash
docker pull omril/logstash-postgres
```
2. Create a file `env.list` with all environment variables, for example:
```
PGUSER=postgres
PGHOST=mypostgres.host.address
PGPASSWORD=mypassword
PGDATABASE=mydatabase
TABLE_NAME=source
ES_USER=esuser
ES_PASSWORD=espassword
ES_INDEX=destination
ES_HOST=myelasticsearch.host.address
```
3. Run the image with the file:
```bash
docker run --env-file ./env.list omril/logstash-postgres
```

### Note:
The Dockerfile is in the repo. You can download it and change it - adapt it for AWS managed service, add a query, etc.