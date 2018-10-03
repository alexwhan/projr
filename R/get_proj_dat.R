#' Get project data
#'
#' @param dir A path
#'
#' @return Path and git remote url if available
#' @export
#'
#' @examples
#' get_proj_dat(".")
get_proj_dat <- function(dir) {
  if(!git2r::in_repository(dir)) return("Not a git repo")

  remote <- git2r::remote_url(dir)

  if(length(remote) == 0) return(dir)

  return(paste(dir, remote))

}
