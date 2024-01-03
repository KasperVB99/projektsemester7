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
summary(fitted_and_predicted$fitted_models$decision_tree_fit$fit$fit$fit)

recipes::step_select(positive_oil_return, knn_variables$term, skip = TRUE)

decision_tree_grid %>% 
  dplyr::group_by(cost_complexity) %>% 
  dplyr::summarise(mean(cost_complexity))

library(tidymodels)
library(vip)

autoplot(tuned_models$grid_results$decision_tree_grid_results) +
  ggthemes::theme_economist()

hej = broom::tidy(fitted_and_predicted$fitted_models$logit_fit) %>% 
  dplyr::mutate(estimate = abs(estimate))

fitted_and_predicted$fitted_models$decision_tree_fit

evaluated_models$cv_accuracy$decision_tree$measures$overall

evaluated_models$cv_accuracy$decision_tree$conf_mat

fitted_and_predicted$fitted_models$logit_fit %>% 
  extract_fit_parsnip() %>% 
  vip::vip(num_features = 10, include_type = TRUE)

fitted_and_predicted$fitted_models$logit_fit %>% 
  extract_fit_parsnip() %>% 
  vip::vip(num_features = 10, include_type = TRUE) +
  ggthemes::theme_economist() +
  ggplot2::labs(y = "Importance score") +
  ggplot2::scale_x_discrete(labels=c("WTI oil, 2 lags", "Proshares nat. gas, 1 lag ",
                                     "US brent fund, 2 lags", "DFA commodity_strat, 3 lags", 
                                     "US nat. gas fund, 1 lag", "Blackrock commodity, 1 lag",
                                     "Brent oil, 2 lags", "DFA commodity strat., 1 lag", 
                                     "Brent oil, 1 lag", "US brent fund, 1 lag"))

fitted_and_predicted$fitted_models$decision_tree_fit %>% 
  extract_fit_parsnip() %>% 
  vip::vip(num_features = 10, include_type = TRUE) +
  ggthemes::theme_economist() +
  ggplot2::scale_x_discrete(labels=c("New York gasoline price, 1 lag", "Gulf gasoline price, 3 lags",
                                     "VIX short-term future, 1 lag", "Brent oil, 2 lags", 
                                     "Proshares nat. gas, 1 lag", "US nat. gas fund, 1 lag",
                                     "Gulf gasoline price, 1 lag", "US brent fund, 1 lag", 
                                     "WTI oil, 1 lag", "Brent oil, 1 lag"))

hej = split_data$testing

hej = raw_data$all_together_list %>% 
  purrr::reduce(dplyr::full_join) %>% 
  dplyr::arrange(date) %>% 
  dplyr::mutate(weekday = lubridate::wday(date, getOption("lubridate.week.start", 1))) %>% 
  dplyr::filter(weekday != "sø") %>% 
  dplyr::mutate(positive_oil_return = 
                  as.factor(dplyr::if_else(log(oil_price_europe / dplyr::lag(oil_price_europe)) 
                                           > 0, 1, 0))) %>% 
  dplyr::mutate(dplyr::across(tidyselect::where(is.numeric), ~ . - dplyr::lag(.))) %>% 
  timetk::tk_augment_lags(tidyselect::where(is.numeric), 
                          .lags = 1:3)
  
  
  lubridate::wday(raw_data$all_together$date)

raw_data$all_together

evaluated_models$out_of_sample_accuracy$decision_tree$conf_mat

evaluated_models$out_of_sample_accuracy$decision_tree$measures$overall

logit = broom::tidy(fitted_and_predicted$fitted_models$logit_fit)

fitted_and_predicted$fitted_models$decision_tree_fit$fit$fit$fit %>% rpart.plot::rpart.plot()

xtable::xtable(evaluated_models$cv_accuracy$logit$conf_mat, type = "latex", digits = 3)

evaluated_models$out_of_sample_accuracy$knn$conf_mat

hej = model_evaluation(fitted_and_predicted, split_data, tuned_models)

accuracy = list(in_sample_accuracy = in_sample_accuracy,
                cv_accuracy = cv_accuracy,
                out_of_sample_accuracy = out_of_sample_accuracy)

return(accuracy)


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

targets::tar_visnetwork()

devtools::source_gist("https://gist.github.com/brshallo/7d180bde932628a151a4d935ffa586a5")

split_data$resamples  %>% 
  extract_dates_rset() %>% 
  print() %>% 
  dplyr::mutate(id = sub("Slice", "Resample ", id)) %>% 
  plot_dates_rset() +
  ggthemes::theme_economist() +
  theme(legend.position = "none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank())
