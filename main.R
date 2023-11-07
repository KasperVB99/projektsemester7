library(magrittr)
#-------------------------------------------------------------------------------

targets::tar_make()

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


