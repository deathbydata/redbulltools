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
                 Port = Server = config::get("gis")$port)
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
                 Port = Server = config::get("ods")$port)
}

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
                 Port = Server = config::get("insightsnowlogging")$port)
}

#' Quick-connect to the Bulldrive system
#'
#' This function is a wrapper around the egnyter::set_token
#' function and presumes you have appropriate config
#' and environment variables set up.
#'
#' @export
connect_to_bulldrive <- function() {
  egnyter::set_token(domain = config::get("bulldrive")$domain,
                     app_key = config::get("bulldrive")$apikey,
                     username = config::get("workbench")$username,
                     password = config::get("workbench")$password)
}
