model_specification = function(){
  model_spec_logistic = parsnip::logistic_reg(
    mode = "classification",
    engine = "glm"
  )
  
  model_spec_knn = parsnip::nearest_neighbor(
    mode = "classification",
    engine = "kknn"
  )
  
  models = list(model_spec_logistic = model_spec_logistic,
                model_spec_knn = model_spec_knn)
  
  return(models)
  
}
