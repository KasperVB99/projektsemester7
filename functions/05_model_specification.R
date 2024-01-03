model_specification = function(){
  model_spec_logit = parsnip::logistic_reg(
    mode = "classification",
    engine = "glmnet",
    penalty = parnsip::tune(),
  )
  
  model_spec_knn = parsnip::nearest_neighbor(
    mode = "classification",
    engine = "kknn",
    neighbors = parsnip::tune()
  )
  
  model_spec_decision_tree = parsnip::decision_tree(
    mode = "classification",
    engine = "rpart",
    tree_depth = 3,
    min_n = parsnip::tune(),
    cost_complexity = 0.00316
  )
  
  
  models = list(model_spec_logit = model_spec_logit,
                model_spec_knn = model_spec_knn,
                model_spec_decision_tree = model_spec_decision_tree)
  
  return(models)
}
