#' Create a Bulldrive folder structure for the project
#'
#' This function creates an appropriate project folder
#' structure in Bulldrive using the project name as
#' the top-level folder name.
#'
#' @param project_name The name of the project (folder)
#'
#' @export
create_project_folders <- function(project_name, where = config::get("bulldrive")$project_folder) {
  # Convert lower cases, strip punctuation
  project_name <- stringr::str_to_lower(project_name)

  project_folder = paste(where, project_name, sep = "/")

  user_confirmation <- menu(c("Yes", "No"), title = paste0("Are you sure you want to create a project folder structure under [", project_folder ,"]?"))

  if (user_confirmation == 1) {
    egnyter::create_folder(where, project_name)
    Sys.sleep(0.75) # Max 2 API calls per second
    egnyter::create_folder(project_folder, "1-input")
    Sys.sleep(0.75)
    egnyter::create_folder(project_folder, "2-data")
    Sys.sleep(0.75)
    egnyter::create_folder(project_folder, "3-analysis")
    Sys.sleep(0.75)
    egnyter::create_folder(project_folder, "4-output")
    Sys.sleep(0.75)
    egnyter::create_folder(project_folder, "5-presentations")
    Sys.sleep(0.75)
    egnyter::create_folder(project_folder, "9-admin")
  }
}
