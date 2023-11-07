model_tuning = function(split_data, defined_workflows){
  resamples = split_data$resamples
  logit_workflow = defined_workflows$logit_workflow
  knn_workflow = defined_workflows$knn_workflow
  
  
  knn_grid = dials::grid_regular(dials::neighbors(),
                                 levels = 10)
  knn_grid_results = knn_workflow %>% 
    tune::tune_grid(
      resamples = split_data$resamples,
      grid = knn_grid
    )
  best_knn = knn_grid_results %>% 
    tune::select_best("accuracy")
  
  finalized_knn_workflow = knn_workflow %>% 
    tune::finalize_workflow(best_knn)
  
  finalized_workflows = list(finalized_knn_workflow = finalized_knn_workflow)
  
  grid_results = list(knn_grid_results = knn_grid_results)
  
  tuned_models = list(finalized_workflows = finalized_workflows,
                      grid_results = grid_results)
  
  return(tuned_models)
  
}