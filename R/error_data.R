#' error_data
#'
#' @param data 
#' @param parameter 
#' @param estimate 
#' @param totalerror_sd 
#'
#' @return
#' @export
#'
error_data <- function(data, parameter, estimate, totalerror_sd, subset = NULL)
{
  if (is.null(subset)) {
    resid <- data[[parameter]] - data[[estimate]]
    e <- matrix(c(resid,
                  resid / sd(resid),
                  resid / (1 / data[[totalerror_sd]])),
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
                    resid / (1 / tempdata[[totalerror_sd]])),
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
  return(edata)
}