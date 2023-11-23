library(magrittr)
R.utils::sourceDirectory("./functions", modifiedOnly = FALSE)
R.utils::sourceDirectory("./functions/other_functions", modifiedOnly = FALSE)

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
    tuned_models,
    model_tuning(
      split_data = split_data,
      defined_workflows = defined_workflows
    )
  ),
  targets::tar_target(
    fitted_and_predicted,
    fit_and_predict(
      finalized_workflows = tuned_models$finalized_workflows,
      split_data = split_data
    )
  ),
  targets::tar_target(
    evaluated_models,
    model_evaluation(
      fitted_and_predicted = fitted_and_predicted,
      split_data = split_data,
      tuned_models = tuned_models
    )
  )
)
