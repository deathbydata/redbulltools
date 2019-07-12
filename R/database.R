#' Create a Bulldrive folder structure for the project
#'
#' This function creates an appropriate project folder
#' structure in Bulldrive using the project name as
#' the top-level folder name.
#'
#' @param x dbplyr pipe / remote tbl object
#' @param name name for new remote object (including schema)
#' @param dest remote data source connection
#' @param type specify whether the object is a view (default or table)
#'
#' @export
#' @importFrom magrittr %>%
create_database_object <- function(x, name, dest, type = c("view", "table")) {

  # Get the raw query string for the query object
  raw_query <- dbplyr::remote_query(query)

  # Strip the "<SQL>" header text that remote_query adds
  strip_header <- stringr::str_replace_all(raw_query, "<SQL>", "")

  # What are we creating?
  if(type == "view") {
    create_text <- "CREATE VIEW "
  }
  else {
    create_text <- "CREATE TABLE "
  }

  # SQL code to create the new object
  object_create_sql <- paste0(create_text, name," AS (", strip_header ,");")

  # Execute the create code
  # Need to test if already exists??
  DBI::dbGetQuery(dest, object_create_sql)
}
