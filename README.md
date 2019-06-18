
# redbulltools

The redbulltools package provides helper and utility functions for Data
Science teams at Red Bull. Most of these are simply wrappers around
existing utilities and functions that should serve to improve speed,
reproducibility and consistency.

## Setting up

To get everything working properly you will need to use the `config`
package and your environment variables to store all sensitive
credentials or connection information to your R environment.

Templates for the `config.yml` file and `.Renviron` file are available
in the templates folder of this package.

## Functionality

### Connecting to internal databases

The `connect_to_database` function is a wrapper around `DBI::dbConnect`
that allows you to reference connection parameters that are saved in
your configuration variables.

To use this function, firstly make sure you have your database
connection parameters stored in your `.Renviron` file and that your
`config.yml` file is set up as in the template (in this repository):

``` r
  my_new_database:
    driver: !expr Sys.getenv("NEW_DB_DRIVER")
    uid: !expr Sys.getenv("NEW_DB_UID")
    pwd: !expr Sys.getenv("NEW_DB_PWD")
    server: !expr Sys.getenv("NEW_DB_SERVER")
    port: !expr Sys.getenv("NEW_DB_PORT")
```

Note that the config variable is the name of the database
(“my\_new\_database”) and the sub-variables are all lower-case.

To connect to this database you can simply reference it by name.

``` r
new_db_connection <- connect_to_database("my_new_database")
```

This function can also pass additional variables to
dbConnect.

``` r
# If we want to connect to a specific DB within the my_new_database environment (e.g. SQL)
new_db_connection_2 <- connect_to_database("my_new_database", DB = "THISDB")
```

### Connecting to the Bulldrive

Assuming you have your Bulldrive credentials stored correctly using
config and environment variables you can quickly save your token to your
local options using the following syntax.

You need to have [egnyter](http://github.com/deathbydata/egnyter)
installed for this function to work.

``` r
connect_to_bulldrive()
get_parameter("token")
```

### Creating a new project folder structure

When starting a new project you can use the `create_project_folder`
function to set up a
[Cookiecutter](https://drivendata.github.io/cookiecutter-data-science/)
style directory structure in the Bulldrive. You need to have
[egnyter](http://github.com/deathbydata/egnyter) installed and the
`BULLDRIVE_PROJECT_FOLDER` environment variable set for this function to
work.

``` r
create_project_folders("My Super Cool Project")
```
