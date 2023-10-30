library(magrittr)
#-------------------------------------------------------------------------------

targets::tar_make()

#-------------------------------------------------------------------------------

targets::tar_load("raw_data")
targets::tar_load("split_data")
targets::tar_load("engineered_features")

#-------------------------------------------------------------------------------

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


rsample::training(clean_data)

visdat::vis_miss(raw_data)

 ggplot2::ggplot(raw_data, ggplot2::aes(x = usd_exchange, y = oil_price)) +
  ggplot2::geom_line()

hej = raw_data %>% 
  tsibble::as_tsibble() %>% 
  dplyr::transmute(log_return_oil = log(oil_price / dplyr::lag(oil_price)))


summary(glm(positive_oil_return ~ oil_return_1_lag, data = engineered_features))