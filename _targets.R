library(magrittr)
R.utils::sourceDirectory("./functions", modifiedOnly = FALSE)

list(
  targets::tar_target(
    raw_data,
    data_loading(
      date_start = date_start,
      date_end = date_end
    )
  ),
  targets::tar_target(
    split_data,
    data_splitting(
      raw_data = raw_data
    )
  ),
  targets::tar_target(
    preprocessed_data,
    data_preprocessing(
      training_data = split_data$training
    )
  ),
  targets::tar_target(
    specified_models,
    model_specification(
    )
  ),
  targets::tar_target(
    defined_workflows,
    define_workflows(
      preprocessed_data = preprocessed_data,
      specified_models = specified_models
    )
  ),
  targets::tar_target(
    fit_and_predict,
    fit_and_predict(
      defined_workflows = defined_workflows,
      split_data = split_data
    )
  )
)
