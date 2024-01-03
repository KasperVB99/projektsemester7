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
