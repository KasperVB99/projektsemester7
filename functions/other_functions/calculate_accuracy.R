calculate_accuracy = function(predictions, actual, positive_percent){
  names = c("logit", "knn", "decision_tree")
  accuracy = list()
  for(x in 1:(length(predictions))){
    accuracy[[x]] = tibble::tibble(accuracy= mean(predictions[[x]]$.pred_class
                         == actual),
                         model = names[[x]])
  }
  accuracy = accuracy %>% 
    purrr::reduce(rbind) %>% 
    dplyr::mutate(positive_percent = positive_percent,
                  kc_score = (accuracy - positive_percent) / positive_percent * 100) %>% 
    dplyr::select(accuracy, positive_percent, kc_score, model)
  
  return(accuracy)
}
