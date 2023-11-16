define_workflows = function(preprocessed_data, specified_models){
  logit_model = specified_models$model_spec_logit
  knn_model = specified_models$model_spec_knn
  rand_forest_model = specified_models$model_spec_rand_forest

  logit_recipe = preprocessed_data$logit_recipe
  knn_recipe = preprocessed_data$knn_recipe
  rand_forest_recipe = logit_recipe

  logit_workflow = workflows::workflow() %>%
    workflows::add_recipe(logit_recipe) %>%
    workflows::add_model(logit_model)

  knn_workflow = workflows::workflow() %>%
    workflows::add_recipe(knn_recipe) %>%
    workflows::add_model(knn_model)
  
  rand_forest_workflow = workflows::workflow() %>%
    workflows::add_recipe(rand_forest_recipe) %>%
    workflows::add_model(rand_forest_model)

  workflows = list(logit_workflow = logit_workflow,
                   knn_workflow = knn_workflow,
                   rand_forest_workflow = rand_forest_workflow)
  
  return(workflows)
}