#' Get projects
#'
#' @param dir A path
#'
#' @return vector of project directories
#' @export
#'
#' @examples
#' get_projects(".")
get_projects <- function(dir) {
  if(git2r::in_repository(dir)) return(dir)

  dirs <- list.dirs(dir, recursive = FALSE)

  if(length(dirs) < 2) return(NULL)

  return(purrr::map(dirs, get_projects))
}
