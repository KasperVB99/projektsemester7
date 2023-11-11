fit_and_predict = function(finalized_workflows, split_data){
  logit_workflow = finalized_workflows$finalized_logit_workflow
  knn_workflow = finalized_workflows$finalized_knn_workflow
  split = split_data$initial_split
  
  logit_fit = tune::last_fit(logit_workflow,
                             split)
  
  knn_fit = tune::last_fit(knn_workflow,
                           split)
  
  
  fitted_and_predicted = list(logit_fit = logit_fit,
                              knn_fit = knn_fit)
  
  return(fitted_and_predicted)
}