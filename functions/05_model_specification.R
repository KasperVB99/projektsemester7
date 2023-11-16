model_specification = function(){
  model_spec_logit = parsnip::logistic_reg(
    mode = "classification",
    engine = "glmnet",
    penalty = parnsip::tune(),
    mixture = parsnip::tune()
  )
  
  model_spec_knn = parsnip::nearest_neighbor(
    mode = "classification",
    engine = "kknn",
    neighbors = parsnip::tune()
  )
  
  model_spec_rand_forest = parsnip::rand_forest(
    mode = "classification",
    engine = "ranger",
    trees = parsnip::tune(),
    min_n = parsnip::tune()
  )
  
  
  models = list(model_spec_logit = model_spec_logit,
                model_spec_knn = model_spec_knn,
                model_spec_rand_forest = model_spec_rand_forest)
  
  return(models)
}
