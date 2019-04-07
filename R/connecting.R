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
