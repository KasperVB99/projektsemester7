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
  )
)
