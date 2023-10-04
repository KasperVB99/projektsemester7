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
    clean_data,
    data_cleaning(
      raw_data = raw_data
    )
  ),
  targets::tar_target(
    engineered_features,
    feature_engineering(
      raw_data = raw_data
    )
  )
)
