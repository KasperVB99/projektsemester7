calculate_positive_return = function(split_data){
  mean_cv = list()
  for (x in 1:(length(split_data$resamples$splits))){
    mean_cv[[x]] = split_data$resamples$splits[[x]] %>% 
      rsample::assessment() %>% 
      dplyr::summarise(mean = mean(as.numeric(positive_oil_return) - 1))
    
    mean = purrr::reduce(mean_cv, rbind) %>% 
      dplyr::summarise(mean = mean(mean))
  }
  
  mean_in_sample = mean(as.numeric(split_data$training$positive_oil_return) - 1)
  
  mean_out_of_sample = mean(as.numeric(split_data$testing$positive_oil_return) - 1)
  
  mean_list = list(mean_in_sample = mean_in_sample,
            mean_cv = mean$mean,
            mean_out_of_sample = mean_out_of_sample)
  
  return(mean_list)
}
