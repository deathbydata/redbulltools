
redbulltools
============

The redbulltools package provides helper and utility functions for Data Science teams at Red Bull. Most of these are simply wrappers around existing utilities and functions that should serve to improve speed, reproducibility and consistency.

Setting up
----------

To get everything working properly you will need to use the `config` package and your environment variables to store all sensitive credentials or connection information to your R environment.

Templates for the `config.yml` file and `.Renviron` file are available in the templates folder of this package.

Functionality
-------------

### Connecting to the DAP system

Assuming you have your DAP credentials stored correctly using config and environment variables you can quickly connect to DAP using the following syntax.

``` r
dap_connection <- connect_to_dap()
```

### Connecting to the Bulldrive

Assuming you have your Bulldrive credentials stored correctly using config and environment variables you can quickly save your token to your local options using the following syntax.

You need to have [egnyter](http://github.com/deathbydata/egnyter) installed for this function to work.

``` r
connect_to_bulldrive()
get_parameter("token")
```

### Creating a new project folder structure

When starting a new project you can use the `create_project_folder` function to set up a [Cookiecutter](https://drivendata.github.io/cookiecutter-data-science/) style directory structure in the Bulldrive. You need to have [egnyter](http://github.com/deathbydata/egnyter) installed and the `BULLDRIVE_PROJECT_FOLDER` environment variable set for this function to work.

``` r
create_project_folders("My Super Cool Project")
```
