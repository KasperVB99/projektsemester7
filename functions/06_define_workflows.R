define_workflows = function(preprocessed_data, specified_models){
  logit_model = specified_models$model_spec_logit
  knn_model = specified_models$model_spec_knn
  decision_tree_model = specified_models$model_spec_decision_tree

  logit_recipe = preprocessed_data$logit_recipe
  knn_recipe = preprocessed_data$knn_recipe
  decision_tree_recipe = logit_recipe

  logit_workflow = workflows::workflow() %>%
    workflows::add_recipe(logit_recipe) %>%
    workflows::add_model(logit_model)

  knn_workflow = workflows::workflow() %>%
    workflows::add_recipe(knn_recipe) %>%
    workflows::add_model(knn_model)
  
  decision_tree_workflow = workflows::workflow() %>%
    workflows::add_recipe(decision_tree_recipe) %>%
    workflows::add_model(decision_tree_model)

  workflows = list(logit_workflow = logit_workflow,
                   knn_workflow = knn_workflow,
                   decision_tree_workflow = decision_tree_workflow)
  
  return(workflows)
}