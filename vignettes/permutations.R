# temp <- c("1a", "1b", "2a", "2b", "2c")
# combinat::permn(temp)
# 


#we have multiple bins of different size so total perm is
# number of total perm = bin1 * bin2 * bin3 .... * binN 
# one way to get this is randomly sample from each repeatendly and get the unique solutions
# check the length = total perm
# function repeats till that statement returns true




# 1,1,1
# 1,1,2
# 1,1,3
# 
# 1,2,1
# 1,2,2
# 1,2,3
# 
# 2,1,1
# 2,1,2
# 2,1,3
# 
# 2,2,1
# 2,2,2
# 2,2,3


# we have 2*3 permutations here in lexicographical order
# is there a way to compute this list in R?
# After spending some time on my attempt I found that this has been worked out 
# using the factoradic of a number .... we will skip to the brute force method for now
# 
#   # attempt
# 
# lengthbin <- length(binl)
# flexbin <- lengthbin - 1
# lastgroupsize <-binl[[lengthbin]] %>% length()
# cont <- rep(NA, length(binl))
# 
# binl <- list(c(1,2), c(1,2), c(1,2,3))
# 
# permutation_number <- function(list) {
#   binsizes <- c()
#   for (i in 1:length(list)) {
#     binsizes[i] <- length(list[[i]])
#   }
#   return(prod(binsizes))
# }
# 
# totalnumber <- permutation_number(binl)
# 
# rightmostbin <- length(binl)
# currentbin
# swap / on time swaps
# 
# swap <- function(vector, current) {
#   if (current == max(vector)) {
#     return(NULL)
#   } else {
#     return((vector > current) %>% which %>% min)
#   }
# }
# 
# swapcheck <- function(swapright, binl, i) {
#   if(is.null(swapnum)) {
#     swapright <- binl[[rightmostbin]] %>% min
#     for (j in 1:(length(binl)-1)) {
#       swap(binl[[rightmostbin-j]], temp[i-1,rightmostbin-j])
#     }
#     swapleft <- swap(binl[[rightmostbin-1]], temp[i-1,rightmostbin-j])
#   }
# }
# resetbin
# 
# temp <- matrix(NA, nrow = totalnumber, ncol = length(binl))
# firstperm <- lapply(binl, min) %>% unlist()
# temp[1,] <- firstperm
# for(i in 2:nrow(temp)) {
#   swapright <- swap(binl[[rightmostbin]], temp[i-1,rightmostbin])
#   if(is.null(swapnum)) {
#     
#   }
#   temp[i,rightmostbin] <- swap(binl[[rightmostbin]], temp[i-1,rightmostbin])
# }

# or we can do random sampling probabolistic approach
# -sample from each bin X times
# -take unique permutations
# - if unique = total number computed earlier stop
# - else repeat whole process


bin_markup <- function(data, groups) {
  t <- c()
  for (group in groups) {
    t1 <- data %>% select(group) %>% unlist() %>% as.vector
    t <- paste0(t, t1)
  }
  
  dup1 <- t %>% duplicated(fromLast = TRUE)
  dup2 <- t %>% duplicated(fromLast = FALSE)
  dups <- dup1 | dup2
  t <- t %>% as.factor() %>% as.numeric()
  t[!dups] <- NA
  data <- data %>% 
    dplyr::mutate(duplicates = t) %>% 
    tibble::rowid_to_column("rownum") #add row numbers 
  data <- data %>% 
    dplyr::mutate(non_duplicate = as.numeric(is.na(duplicates)))
  return(data)
}





permutation_number <- function(data, duplicates_vec) {
  bin_size <- rep(NA, length(duplicates_vec))
  for(i in 1:length(duplicates_vec)) {
    bin_size[i] <- data %>% 
      dplyr::filter(duplicates == duplicates_vec[i]) %>%
      nrow()
  }
  return(prod(bin_size))
}


sample_picker <- function(data, duplicates_vec) {
  sample_set <- rep(NA, length(duplicates_vec))
  for(i in 1:length(duplicates_vec)) {
    rows <- data %>% 
      dplyr::filter(duplicates == duplicates_vec[i]) %>%
      dplyr::select("rownum") %>%
      unlist() %>%
      as.vector()
    sample_set[i] <- sample(rows, 1)
  }
  return(sample_set)
}


permutation_set_finder <- function(data, groups) {
  data <- data %>% bin_markup(groups)
  non_duplicate_rownum <- data %>% 
    dplyr::filter(non_duplicate == 1) %>% 
    dplyr::select(rownum) %>% 
    unlist() %>%
    as.vector()
  duplicates_vec <- data %>% 
    filter(complete.cases(.)) %>% 
    select("duplicates") %>% 
    unique() %>% 
    unlist() %>% 
    as.vector()
  perm_num <- permutation_number(data, duplicates_vec)
  i <- 0
  permutations <- list()
  repeat {
    i <- i + 1 
    permutations[[i]] <- sample_picker(data, duplicates_vec)
    if (permutations %>% lapply(is.null) %>% unlist %>% any) {
      toremove <- permutations %>% lapply(is.null) %>% unlist %>% which
      permutations[[toremove]] <- NULL
    }
    if (length(permutations) == perm_num) {
      break
    }
  }
  return(list(permutations = permutations, 
              non_duplicate_rownum = non_duplicate_rownum)
  )
}


