model_evaluation = function(fitted_and_predicted){
  logit_fit = fitted_and_predicted$logit_fit
  knn_fit = fitted_and_predicted$knn_fit
  
  evaluation_knn = tune::collect_metrics(knn_fit) %>% 
    dplyr::mutate(model = "knn")
  
  evaluation_logit = tune::collect_metrics(logit_fit) %>% 
    dplyr::mutate(model = "logit")
  
  evaluation = evaluation_logit %>% 
    dplyr::bind_rows(evaluation_knn) %>% 
    dplyr::filter(.metric == "accuracy") %>% 
    dplyr::select(model, metric = .metric, estimate = .estimate)
  
  return(evaluation)
}
