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

split_data$resamples

sjov = raw_data %>%  timetk::time_series_split(assess = "1 year", cumulative = TRUE)


hej = preprocessed_data$knn_recipe %>% 
  recipes::prep() %>% 
  recipes::bake(new_data = NULL)

tune::autoplot(tuned_models$grid_results$knn_grid_results, metric = "accuracy")

tuned_models$grid_results$logit_grid_results %>% tune::collect_metrics() %>% 
  dplyr::filter(.metric == "accuracy") %>% 
  dplyr::arrange(desc(mean))

raw_data$positive_oil_return

hej = broom::tidy(fitted_and_predicted$logit_fit$.workflow[[1]])

hej


mean(as.numeric(split_data$testing$positive_oil_return)) - 1 

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


