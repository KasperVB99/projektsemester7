model_specification = function(){
  model_spec_logit = parsnip::logistic_reg(
    mode = "classification",
    engine = "glmnet",
    penalty = parnsip::tune(),
    mixture = 1
  )
  
  model_spec_knn = parsnip::nearest_neighbor(
    mode = "classification",
    engine = "kknn",
    neighbors = parsnip::tune()
  )
  
  model_spec_decision_tree = parsnip::decision_tree(
    mode = "classification",
    engine = "rpart",
    tree_depth = parsnip::tune(),
    min_n = parsnip::tune(),
    cost_complexity = parsnip::tune()
  )
  
  
  models = list(model_spec_logit = model_spec_logit,
                model_spec_knn = model_spec_knn,
                model_spec_decision_tree = model_spec_decision_tree)
  
  return(models)
}
