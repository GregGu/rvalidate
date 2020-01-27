#' coverage multiple
#'
#' when there are multiple obervations from same group eg. two observations
#' with the same country and year
#'
#' @param data
#' @param parameter
#' @param lower
#' @param upper
#' @param group_to_check {\emph{\sQuote{Character}} A vector of column names in which the multiple observations occur eg. c("country", "year")
#'
#' @return
#' @export
coverage_multiple <- function(data,
                              parameter,
                              lower,
                              upper,
                              subset = NULL,
                              group_to_check) {
  sets <- data %>%
    permutation_set_finder(group_to_check)
  permutations <- sets$permutations
  non_duplicate_rownum <- sets$non_duplicate_rownum
  cov_list <- list()
  for (j in 1:length(permutations)) {
    dsamp <- data[c(non_duplicate_rownum, permutations[[j]]), ]
    if (is.null(subset)) {
      out_of_coverage <-
        dsamp[[parameter]] < dsamp[[lower]] |
        dsamp[[parameter]] > dsamp[[upper]]
      number_out <- out_of_coverage %>%
        as.numeric() %>%
        sum()
      coverage <- 1 - number_out / nrow(dsamp)
    } else {
      sets <- unique(dsamp[[subset]])
      symsubset <- rlang::sym(subset)
      colname <- rlang::quo_name(subset)
      coverage <-
        tibble::tibble(!!rlang::quo_name(colname) := sets, coverage = NA)
      for (i in 1:length(sets)) {
        set <- sets[i]
        tempdsamp <- dsamp %>% dplyr::filter(!!symsubset == set)
        #alternative to dplyr NSE ... tempdsamp <- dsamp[[dsamp[[subset]] == set,]]
        out_of_coverage <-
          tempdsamp[[parameter]] < tempdsamp[[lower]] |
          tempdsamp[[parameter]] > tempdsamp[[upper]]
        number_out <- out_of_coverage %>%
          as.numeric() %>%
          sum()
        coverage[i, "coverage"] <- 1 - number_out / nrow(dsamp)
      }
    }
    cov_list[[j]] <- coverage
  }
  ld <- do.call(rbind, cov_list)
  fby <- ld %>% dplyr::select(subset) %>% unlist() %>% list()
  median <-
    aggregate(dplyr::select(ld,-subset), by = fby, median) %>%
    dplyr::mutate(statistic = "median")
  sd <- aggregate(dplyr::select(ld,-subset), by = fby, sd) %>%
    dplyr::mutate(statistic = "sd")
  dt <- rbind(median, sd) %>%
    dplyr::select(statistic, Group.1, coverage) %>%
    dplyr::rename(!!rlang::quo_name(colname) := Group.1) #to force the columnname back, base r aggregate changes the name to Group.#
  return(dt)
}


