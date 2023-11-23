model_tuning = function(split_data, defined_workflows){
  resamples = split_data$resamples
  logit_workflow = defined_workflows$logit_workflow
  knn_workflow = defined_workflows$knn_workflow
  rand_forest_workflow = defined_workflows$rand_forest_workflow
  #------------------------------------------
  
  knn_grid = dials::grid_regular(dials::neighbors(),
                                 levels = 10)
  
  knn_grid_results = knn_workflow %>% 
    tune::tune_grid(
      resamples = split_data$resamples,
      grid = knn_grid)
  
  best_knn = knn_grid_results %>% 
    tune::select_best("accuracy")
  
  finalized_knn_workflow = knn_workflow %>% 
    tune::finalize_workflow(best_knn)
  #------------------------------------------
  
  logit_grid = dials::grid_regular(dials::penalty(),
                                   dials::mixture(),
                                 levels = 10)
  
  logit_grid_results = logit_workflow %>% 
    tune::tune_grid(
      resamples = split_data$resamples,
      grid = logit_grid)
  
  best_logit = logit_grid_results %>% 
    tune::select_best("accuracy")
  
  finalized_logit_workflow = logit_workflow %>% 
    tune::finalize_workflow(best_logit)
  #----------------------------------------
  
  rand_forest_grid = dials::grid_regular(dials::cost_complexity(),
                                         dials::tree_depth(),
                                         dials::min_n(),
                                         levels = 2)
  
  rand_forest_grid_results = rand_forest_workflow %>% 
    tune::tune_grid(
      resamples = split_data$resamples,
      grid = rand_forest_grid)
  
  best_rand_forest = rand_forest_grid_results %>% 
    tune::select_best("accuracy")
  
  finalized_rand_forest_workflow = rand_forest_workflow %>% 
    tune::finalize_workflow(best_rand_forest)
  
  
  finalized_workflows = list(finalized_logit_workflow = finalized_logit_workflow,
                             finalized_knn_workflow = finalized_knn_workflow,
                             finalized_rand_forest_workflow = finalized_rand_forest_workflow)
  
  grid_results = list(logit_grid_results = logit_grid_results,
                      knn_grid_results = knn_grid_results,
                      rand_forest_grid_results = rand_forest_grid_results)
  
  tuned_models = list(finalized_workflows = finalized_workflows,
                      grid_results = grid_results)
  
  return(tuned_models)
  
}