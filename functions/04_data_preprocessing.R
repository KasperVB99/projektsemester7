data_preprocessing = function(training_data){
  logistic_recipe = recipes::recipe(training_data) %>% 
    recipes::step_mutate_at(where(is.numeric), fn = ~ log(. / dplyr::lag(.))) %>% 
    recipes::step_mutate(positive_oil_return = dplyr::lag(dplyr::if_else(oil_price_europe > 0, 1, 0))) %>% 
    recipes::step_naomit(positive_oil_return) %>% 
    recipes::step_date(date, features = "dow") %>% 
    recipes::step_dummy(date_dow)
  
  knn_recipe = 
  
  return(oil_recipe)
}
