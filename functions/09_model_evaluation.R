model_evaluation = function(fitted_and_predicted){
  logit_fit = fitted_and_predicted$logit_fit
  knn_fit = fitted_and_predicted$knn_fit
  rand_forest_fit = fitted_and_predicted$rand_forest
  
  evaluation_knn = tune::collect_metrics(knn_fit) %>% 
    dplyr::mutate(model = "knn")
  
  evaluation_logit = tune::collect_metrics(logit_fit) %>% 
    dplyr::mutate(model = "logit")
  
  evaluation_rand_forest = tune::collect_metrics(rand_forest_fit) %>% 
    dplyr::mutate(model = "rand_forest")
  
  evaluation = evaluation_logit %>% 
    dplyr::bind_rows(evaluation_knn, evaluation_rand_forest) %>% 
    dplyr::filter(.metric == "accuracy") %>% 
    dplyr::select(model, metric = .metric, estimate = .estimate)
  
  return(evaluation)
}
