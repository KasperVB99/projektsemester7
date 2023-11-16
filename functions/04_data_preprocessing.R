data_preprocessing = function(training_data){

    logit_recipe = recipes::recipe(positive_oil_return ~ ., training_data) %>% 
      recipes::step_date(date, 
                         features = "dow",
                         keep_original_cols = FALSE) %>%
      recipes::step_dummy(recipes::all_nominal_predictors()) %>%
      recipes::step_rm(c(date_dow_Sat, 
                         date_dow_Fri)) %>% 
      recipes::step_normalize(recipes::all_predictors())

  knn_recipe = logit_recipe %>%
    recipes::step_pca()

  recipes = list(logit_recipe = logit_recipe,
                 knn_recipe = knn_recipe)
  
  return(recipes)
}
