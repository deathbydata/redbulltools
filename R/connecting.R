#' Quick-connect to the DAP system
#'
#' This function is a wrapper around the DBI::dbConnect
#' function and presumes you have appropriate config
#' and environment variables set up.
#'
#' @export
connect_to_dap <- function() {
  DBI::dbConnect(odbc::odbc(),
                 Driver = config::get("dap")$driver,
                 UID = config::get("dap")$uid,
                 PWD = config::get("dap")$pwd,
                 Servernode = config::get("dap")$servernode)
}

#' Quick-connect to the GIS system
#'
#' This function is a wrapper around the DBI::dbConnect
#' function and presumes you have appropriate config
#' and environment variables set up.
#'
#' @export
connect_to_gis <- function() {
  DBI::dbConnect(odbc::odbc(),
                 Driver = config::get("gis")$driver,
                 UID = config::get("gis")$uid,
                 PWD = config::get("gis")$pwd,
                 Server = config::get("gis")$server,
                 Port = config::get("gis")$port,
                 Database = config::get("gis")$database)
}

#' Quick-connect to the ODS system
#'
#' This function is a wrapper around the DBI::dbConnect
#' function and presumes you have appropriate config
#' and environment variables set up.
#'
#' @export
connect_to_ods <- function() {
  DBI::dbConnect(odbc::odbc(),
                 Driver = config::get("ods")$driver,
                 UID = config::get("ods")$uid,
                 PWD = config::get("ods")$pwd,
                 Server = config::get("ods")$server,
                 Port = config::get("ods")$port)
2
#' Quick-connect to the InsightsNow Logging system
#'
#' This function is a wrapper around the DBI::dbConnect
#' function and presumes you have appropriate config
#' and environment variables set up.
#'
#' @export
connect_to_insightsnowlogging <- function() {
  DBI::dbConnect(odbc::odbc(),
                 Driver = config::get("insightsnowlogging")$driver,
                 UID = config::get("insightsnowlogging")$uid,
                 PWD = config::get("insightsnowlogging")$pwd,
                 Server = config::get("insightsnowlogging")$server,
                 Port = config::get("insightsnowlogging")$port,
                 Database = config::get("insightsnowlogging")$database)
}

#' Quick-connect to an internal database using DBI
#'
#' This function is a wrapper around the DBI::dbConnect
#' function and presumes you have appropriate config
#' and environment variables set up.
#'
#' @param db_name The name of the database connection (must match config.yml)
#' @param ... Other arguments passed to dbConnect (such as 'DB')
#'
#' @export
connect_to_database <- function(db_name, ...) {
  # Check if database config exists in the config.yml file
  if(is.null(config::get(db_name))) {
    stop(paste0("No config variables available for database: ", db_name), call. = F)
  }

  # Pull credentials from config vars
  db_credentials <- config::get(db_name)

  # Need to rename config vars - title/upper case required depending on variable
  names(db_credentials) <- ifelse(names(db_credentials) %in% c('uid','pwd','db'),
                                  stringr::str_to_upper(names(db_credentials)),
                                  stringr::str_to_title(names(db_credentials)))

  # Group the arguments into a single object including odbc driver and ...
  arg.list = c(odbc::odbc(), db_credentials, ...)

  # Splice arguments into dbConnect and return this object
  do.call(DBI::dbConnect, arg.list)
}
