# getting he total number of occuernces per taxon level 
process_counts <- function(df, taxon_level){
  counts <- df %>%
    group_by(.data[[taxon_level]]) %>%
    summarise(total_count = sum(individualCount))
  
  return(counts)
}

# function to obtain the accurate number of counts per feature
process_counts_per_feature <- function(df, feature, taxon_level) {
  counts <- df %>%
    group_by(.data[[feature]], .data[[taxon_level]]) %>%
    summarise(total_count = sum(individualCount))
  
  return(counts)
}

# function to obtain accurate number of counts per feature per timescale
process_counts_per_feature_per_time <- function(df, timescale, feature, taxon_level) {
  counts <- df %>%
    group_by(.data [[timescale]], .data[[feature]], .data[[taxon_level]]) %>%
    summarise(total_count = sum(individualCount))
  
  return(counts)
}

# biodiversity 
# the input df needs to already be formated so it is has the total counts by location and taxon level
biodiversity_indexes <- function(df, taxon_level){ 
  biodiv <- df %>%
    group_by(stateProvince) %>%
    summarise(
      richness_index = n_distinct(.data[[taxon_level]]),
      simpson_index = diversity(data.frame(obs = total_count), index = "simpson"),
      shannon_wiener_index = diversity(data.frame(obs = total_count), index = "shannon"))
  
  return(biodiv)
}

# yearly biodiversity 
# the input df needs to already be formated so it is has the total counts by formatted date, location and taxon level
biodiversity_indexes_yearly <- function(df, taxon_level){ 
  biodiv <- df %>%
    group_by(formatted_date, stateProvince) %>%
    summarise(
      richness_index = n_distinct(.data[[taxon_level]]),
      simpson_index = diversity(data.frame(obs = total_count), index = "simpson"),
      shannon_wiener_index = diversity(data.frame(obs = total_count), index = "shannon"))
  
  return(biodiv)
}