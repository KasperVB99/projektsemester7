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

b = fitted_and_predicted$out_of_sample_predictions$logit_oos_predict
mean(as.numeric(b$.pred_class)-1)


mfs_commodity_stat_a = tidyquant::tq_get("MCSAX", 
                                         from = date_start,
                                         to = date_end) %>% 
  dplyr::select(date = date, mfs_commodity_stat_a = close) %>% 
  dplyr::arrange(date)


length(split_data$testing$positive_oil_return)
length(split_data$training$positive_oil_return)

hej1 = split_data$training %>% 
  dplyr::select(-date) %>% 
  correlationfunnel::binarize() %>% 
  correlationfunnel::correlate(target = positive_oil_return__0) %>% 
  correlationfunnel::plot_correlation_funnel(interactive = TRUE)

hej = broom::tidy(fitted_and_predicted$fitted_models$logit_fit)

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
