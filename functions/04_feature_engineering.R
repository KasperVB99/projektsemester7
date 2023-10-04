feature_engineering = function(raw_data){
  
  engineered_features = raw_data %>% 
    dplyr::mutate(log_return_oil = log(oil_price / dplyr::lag(oil_price))) %>% 
    dplyr::mutate(positive_oil_return = dplyr::if_else(log_return_oil > 0, 1, 0),
                  oil_return_1_lag = dplyr::lag(log_return_oil)) %>% 
    dplyr::select(date, positive_oil_return, oil_return_1_lag)
}
