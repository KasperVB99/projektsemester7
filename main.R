library(magrittr)
#-------------------------------------------------------------------------------

targets::tar_make_future(workers = 5)

#-------------------------------------------------------------------------------

targets::tar_load("raw_data")
targets::tar_load("split_data")
targets::tar_load("preprocessed_data")
targets::tar_load("specified_models")
targets::tar_load("defined_workflows")
targets::tar_load("tuned_models")
targets::tar_load("fitted_and_predicted")
targets::tar_load("evaluated_models")

#-------------------------------------------------------------------------------



save(knn_variables, file = "knn_variables")

load("knn_variables")

knn_variables = broom::tidy(fitted_and_predicted$fitted_models$logit_fit) %>% 
  dplyr::filter(estimate < -0.1 | estimate > 0.1,
                term != "(Intercept)") %>% 
  dplyr::select(term)

preprocessed_data$knn_recipe %>% 
  recipes::step_select(recipes::all_outcomes(), variables$term) %>% 
  recipes::prep() %>% 
  recipes::bake(new_data = NULL)

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
# 9. Kan der være nogle regimer i olieprisen (er der større sandsynlighed for at olieprisen stiger,
#       når den fx. er steget mere end 50% af de sidste 10 dage?)
