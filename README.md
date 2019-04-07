
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
