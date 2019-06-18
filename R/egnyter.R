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
