library(magrittr)
#-------------------------------------------------------------------------------

targets::tar_make()

#-------------------------------------------------------------------------------

targets::tar_load("raw_data")
targets::tar_load("split_data")
targets::tar_load("preprocessed_data")
targets::tar_load("specified_models")
targets::tar_load("defined_workflows")
targets::tar_load("fit_and_predict")

#-------------------------------------------------------------------------------

logit_recipe = recipes::recipe(positive_oil_return ~ ., split_data$training) %>% 
  recipes::step_mutate_at(recipes::all_numeric_predictors(), 
                          fn = ~ . - dplyr::lag(.)) %>% 
  recipes::step_date(date, features = "dow") %>%
  recipes::step_dummy(date_dow) %>%
  recipes::step_bin2factor(dplyr::contains("date_dow")) %>%
  recipes::step_lag(recipes::all_numeric_predictors(), 
                    keep_original_cols = FALSE) %>% 
  recipes::step_rm(c(date, date_dow_Sat, date_dow_Fri)) %>% 
  recipes::step_corr(recipes::all_numeric_predictors()) %>% 
  recipes::step_naomit(dplyr::contains("lag_1"), skip = FALSE)

hej = logit_recipe %>% 
  recipes::prep() %>% 
  recipes::bake(new_data = split_data$testing)


hej = fit_and_predict$logit_fit_and_predict$logit_prediction

preprocessed_data$logit_recipe %>% 
  recipes::prep() %>% 
  recipes::bake(new_data = split_data$testing)


evaluation = fit_and_predict$knn_fit_and_predict$knn_prediction %>% 
  dplyr::bind_cols(hej$positive_oil_return)

score = evaluation %>% 
  yardstick::accuracy(truth = `...2`, estimate = .pred_class)
  

## Idéer til feature engineering:
# 1. Gårsdagens udvikling på det amerikanske aktiemarked
# 2. Gårsdagens udvikling på oliemarkedet (AR)
# 3. Noget volatilitet?? (giver måske ikke meget mening i en klassifikationsmodel)
# 4. Dollar-kursen
# 5. Kursen på amerikanske statsobligationer
# 6. Kursen på andre 'sammenlignelige" råvarer
#    - Kan der evt. være en tendens til, at olieprisen stiger,
#       når gas- eller kornprisen stiger?
# 7. Produktionssiden
# 8. Oliebeholdninger

