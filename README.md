# hasura-quick-start
This is the N+1 getting started repo. I've taken the basics of getting started locally and added a schema with tables, migrations, and the next X steps.

## Install & Use

This is a very basic Hasura project. To use this complete the following steps.

1. Clone this repo `git clone `.
2. From the root (where the docker-compose.yml file is located) execute `docker compose up -d`.
3. Navigate into the `hasura` directory.
4. Execute `hasura metadata apply`, then `hasura migrate apply`, and then `hasura metadata apply`. Just do it, it's a strange workflow thing.
4. Go to the "Data" tab on the console interface and add a connection with the 'PG_DATABASE_URL' environment variable.
5. Back at the terminal, execute `hasura migrate apply`. Select default or all databases when prompted which database to run migrations against.
6. Navigate now into the `hasura` directory and execute `hasura console`.

## The Build

The steps I followed to build out this example starter includes:

1. Created the directory "hasura-quick-start".
2. Installed the Hasura CLI.
3. Pulled the latest Docker Compose file.
4. Ran `hasura init` in the directory "hasura-quick-start" for the basic folder structure under `hasura`.
5. Launched `hasura console` for this instance and added the database connection for `PG_DATABASE_URL`.
6. Continued building out the database from the console so that migrations would be built.
7. Used the console to add some data, which added to the migrations.
8. Finished. This is now what this existing repository consists of.

## Projects Using This Repository

There are other project(s) (currently just one [here](https://github.com/Adron/hasura-spring-boot-graphql)) that will use this as a base project. As I build out these other projects they will be listed here:

* [hasura-spring-boot-graphql](https://github.com/Adron/hasura-spring-boot-graphql)
* [hasura-dotnet-graphql](https://github.com/Adron/hasura-dotnet-graphql)
