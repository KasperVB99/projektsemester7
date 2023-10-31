library(magrittr)
#-------------------------------------------------------------------------------

targets::tar_make()

#-------------------------------------------------------------------------------

targets::tar_load("raw_data")
targets::tar_load("split_data")
targets::tar_load("preprocessed_data")

#-------------------------------------------------------------------------------


oil_recipe = recipes::recipe(split_data$training) %>% 
  recipes::step_mutate_at(where(is.numeric), fn = ~ log(. / dplyr::lag(.))) %>% 
  recipes::step_mutate(positive_oil_return = dplyr::lag(dplyr::if_else(oil_price_europe > 0, 1, 0))) %>% 
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
