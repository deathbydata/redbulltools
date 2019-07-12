#' Create a Bulldrive folder structure for the project
#'
#' This function creates an appropriate project folder
#' structure in Bulldrive using the project name as
#' the top-level folder name.
#'
#' @param x dbplyr pipe / remote tbl object
#' @param name name for new remote object
#' @param dest remote data source connection
#' @param type specify whether the object is a view (default or table)
#'
#' @export
#' @importFrom magrittr %>%
create_database_object <- function(x, name, dest, type = c("view", "table")) {
  # Get the raw value
  raw_query <- dbplyr::remote_query(query)
  strip_header <- stringr::str_replace_all(raw_query, "<SQL>", "")
  view_query <- paste0("CREATE VIEW ", view_name, " AS (", strip_header, ");")
  DBI::dbGetQuery(connection, view_query)
}
