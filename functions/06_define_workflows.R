define_workflows = function(preprocessed_data, models){
  logistic_model = models$model_spec_logistic
  knn_model = models$model_spec_knn
  
  logistic_recipe = preprocessed_data$logistic_recipe
  knn_recipe = preprocessed_data$knn_recipe
  
  formula = "positive_oil_return ~ ."
  
  logistic_workflow = workflows::workflow() %>% 
    workflows::add_recipe(logistic_recipe) %>% 
    workflows::add_model(logistic_model)
  
  knn_workflow = workflows::workflow() %>% 
    workflows::add_recipe(knn_recipe) %>% 
    workflows::add_model(knn_model)
  
  workflows = list(logistic_workflow = logistic_workflow,
                   knn_workflow = knn_workflow)
}