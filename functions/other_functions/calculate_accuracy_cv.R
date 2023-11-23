calculate_accuracy_cv = function(tuned_models, positive_percent){
  names = c("logit", "knn", "decision_tree")
  accuracy = list()
  for (x in 1:(length(tuned_models$grid_results))){
    accuracy[[x]] = tuned_models$grid_results[[x]] %>% 
      tune::collect_metrics() %>% 
      dplyr::filter(.metric == "accuracy") %>% 
      dplyr::arrange(desc(mean)) %>% 
      dplyr::slice(1) %>% 
      dplyr::select(accuracy = mean) %>% 
      dplyr::mutate(model = names[[x]])
  }
  
  accuracy = accuracy %>% 
    purrr::reduce(rbind) %>% 
    dplyr::mutate(positive_percent = positive_percent,
                  kc_score = (accuracy - positive_percent) / positive_percent * 100) %>% 
    dplyr::select(accuracy, positive_percent, kc_score, model)
    
  
  return(accuracy)
}
