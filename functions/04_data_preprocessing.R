data_preprocessing = function(training_data){

    logit_recipe = recipes::recipe(positive_oil_return ~ ., training_data) %>% 
      recipes::step_date(date, 
                         features = "dow",
                         keep_original_cols = FALSE) %>%
      recipes::step_dummy(date_dow) %>%
      recipes::step_bin2factor(dplyr::contains("date_dow")) %>%
      recipes::step_rm(c(date_dow_Sat, 
                         date_dow_Fri)) %>% 
      recipes::step_corr(recipes::all_numeric_predictors())

  knn_recipe = logit_recipe %>%
    recipes::step_normalize(recipes::all_numeric_predictors())

  recipes = list(logit_recipe = logit_recipe,
                 knn_recipe = knn_recipe)
  
  return(recipes)
}
