#' rv_error
#' 
#' \describe{
#'    \item{error (denoted \eqn{\epsilon}) = \eqn{y - \hat{y}}}
#'    \item{standard error = \eqn{\epsilon / sd(\epsilon)}}
#'    \item{adjusted error = \eqn{\epsilon / (1 / total standard error )}}
#' }
#'
#' @param data \emph{\sQuote{Tibble}} formated as our example package data \code{\link[rvalidate:simdata]{rvalidate:simdata}}
#' @param parameter \emph{\sQuote{Character}} columm name of parameter in your data
#' @param estimate  \emph{\sQuote{Character}} column name of estimate in your data
#' @param total_standard_error \emph{\sQuote{Character}} column name of total standard error in your data
#'
#' @return \emph{\sQuote{Tibble}} as a table with errors
#' @export
#'
rv_error <- function(data, parameter, estimate, total_standard_error, subset = NULL)
{
  if (is.null(subset)) {
    resid <- data[[parameter]] - data[[estimate]]
    e <- matrix(c(resid,
                  resid / sd(resid),
                  resid / (1 / data[[total_standard_error]])),
                ncol = 3)
    rownames<- c("error", "standard error", "adjusted error")
    edata <- tibble::tibble(
                            "." = rownames,
                            mean = e %>% apply(2, mean),
                            absolute_mean = e %>% apply(2, abs) %>% apply(2, mean),
                            median = e %>% apply(2, median),
                            absolute_median = e %>% apply(2, abs) %>% apply(2, median)
    )
  } else {
    sets <- unique(data[[subset]])
    symsubset <- rlang::sym(subset)
    colname <- rlang::quo_name(subset)
    rownames <- c("error", "standard error", "adjusted error")
    edata <- tibble::tibble(!!rlang::quo_name(colname) := NA, 
                            "." = rownames,#rep(rownames, length(sets)),
                            mean = NA,
                            absolute_mean = NA,
                            median = NA,
                            absolute_median = NA
                            )
    elist <- list()
    for(i in 1:length(sets)) {
      set <- sets[i]
      tempdata <- data %>% dplyr::filter(!!symsubset == set)
      resid <- tempdata[[parameter]] - tempdata[[estimate]]
      e <- matrix(c(resid,
                    resid / sd(resid),
                    resid / (1 / tempdata[[total_standard_error]])),
                  ncol = 3)
      edata <- tibble::tibble(!!rlang::quo_name(colname) := set, 
                              "." = rownames,#rep(rownames, length(sets)),
                              mean = e %>% apply(2, mean),
                              absolute_mean = e %>% apply(2, abs) %>% apply(2, mean),
                              median = e %>% apply(2, median),
                              absolute_median = e %>% apply(2, abs) %>% apply(2, median)
      )
      elist[[i]] <- edata
    }
    edata <- do.call(rbind, elist)
  }
  edata <- edata %>%
    dplyr::mutate(error_numeric_code = as.numeric(as.factor(.))) %>%
    dplyr::arrange(error_numeric_code) %>%
    dplyr::select(".", source, dplyr::everything(), -error_numeric_code)
  return(edata)
}