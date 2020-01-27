#' rv_error
#' 
#' \describe{
#'    \item{error (denoted \eqn{\epsilon}) = \eqn{y - \hat{y}}}
#'    \item{standard error = \eqn{\epsilon / sd(\epsilon)}}
#'    \item{adjusted error = \eqn{\epsilon / (1 / total standard error )}}
#' }
#'
#' @param data \emph{\sQuote{Tibble}} formated as our example package data \code{\link[rvalidate:rv_data]{rvalidate:rv_data}}
#' @param parameter \emph{\sQuote{Character}} columm name of parameter in your data
#' @param estimate  \emph{\sQuote{Character}} column name of estimate in your data
#' @param total_standard_error \emph{\sQuote{Character}} column name of total standard error in your data
#'
#' @return \emph{\sQuote{Tibble}} as a table with errors
#' @export
#'
rv_error_multiple <-
  function(data,
           parameter,
           estimate,
           total_standard_error,
           subset = NULL,
           group_to_check)
  {
  sets <- data %>%
    permutation_set_finder(group_to_check)
  permutations <- sets$permutations
  non_duplicate_rownum <- sets$non_duplicate_rownum
  e_list <- list()
  for (j in 1:length(permutations)) {
    dsamp <- data[c(non_duplicate_rownum, permutations[[j]]),]
    
    if (is.null(subset)) {
      resid <- dsamp[[parameter]] - dsamp[[estimate]]
      e <- matrix(c(resid,
                    resid / sd(resid),
                    resid / (1 / dsamp[[total_standard_error]])),
                  ncol = 3)
      rownames <- c("error", "standard error", "adjusted error")
      edsamp <- tibble::tibble(
        statistic = rownames,
        mean = e %>% apply(2, mean),
        absolute_mean = e %>% apply(2, abs) %>% apply(2, mean),
        median = e %>% apply(2, median),
        absolute_median = e %>% apply(2, abs) %>% apply(2, median)
      )
    } else {
      sets <- unique(dsamp[[subset]])
      symsubset <- rlang::sym(subset)
      colname <- rlang::quo_name(subset)
      rownames <- c("error", "standard error", "adjusted error")
      edsamp <- tibble::tibble(
        !!rlang::quo_name(colname) := NA,
        statistic = rownames,
        #rep(rownames, length(sets)),
        mean = NA,
        absolute_mean = NA,
        median = NA,
        absolute_median = NA
      )
      elist <- list()
      for (i in 1:length(sets)) {
        set <- sets[i]
        tempdsamp <- dsamp %>% dplyr::filter(!!symsubset == set)
        resid <- tempdsamp[[parameter]] - tempdsamp[[estimate]]
        e <- matrix(c(resid,
                      resid / sd(resid),
                      resid / (1 / tempdsamp[[total_standard_error]])),
                    ncol = 3)
        edsamp <- tibble::tibble(
          !!rlang::quo_name(colname) := set,
          statistic = rownames,
          #rep(rownames, length(sets)),
          mean = e %>% apply(2, mean),
          absolute_mean = e %>% apply(2, abs) %>% apply(2, mean),
          median = e %>% apply(2, median),
          absolute_median = e %>% apply(2, abs) %>% apply(2, median)
        )
        elist[[i]] <- edsamp
      }
      edsamp <- do.call(rbind, elist)
    }
    e_list[[j]] <- edsamp
  }
  ld <- do.call(rbind, e_list)
  ld <- ld %>%
    dplyr::group_by(statistic, !!symsubset) %>%
    dplyr::summarise_all(.funs = c(meansd)) %>%
    dplyr::mutate(error_numeric_code = as.numeric(as.factor(statistic))) %>%
    dplyr::arrange(error_numeric_code) %>%
    dplyr::select(statistic, !!symsubset, dplyr::everything(),-error_numeric_code)
    
    
  return(ld)
}