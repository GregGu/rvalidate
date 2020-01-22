#' coverage
#'
#' @param data 
#' @param parameter 
#' @param lower 
#' @param upper 
#'
#' @return
#' @export
coverage <- function(data, parameter, lower, upper, subset = NULL) {
  if (is.null(subset)) {
    out_of_coverage <- data[[parameter]] < data[[lower]] | data[[parameter]] > data[[upper]]
    number_out <- out_of_coverage %>%
      as.numeric() %>%
      sum()
    coverage <- 1 - number_out/nrow(data)
  } else {
    sets <- unique(data[[subset]])
    symsubset <- rlang::sym(subset)
    colname <- rlang::quo_name(subset)
    coverage <- tibble::tibble(!!rlang::quo_name(colname) := sets, coverage = NA)
    for(i in 1:length(sets)) {
      set <- sets[i]
      tempdata <- data %>% dplyr::filter(!!symsubset == set)
      out_of_coverage <- tempdata[[parameter]] < tempdata[[lower]] | tempdata[[parameter]] > tempdata[[upper]]
      number_out <- out_of_coverage %>%
        as.numeric() %>%
        sum()
      coverage[i,"coverage"] <- 1 - number_out/nrow(data)
    }
  }
  return(coverage)
}

