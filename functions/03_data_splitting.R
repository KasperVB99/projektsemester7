data_splitting = function(raw_data){
  
  initial_split = raw_data %>% 
    timetk::time_series_split(assess = "18 months", cumulative = TRUE)
  
  training = rsample::training(initial_split)
  testing = rsample::testing(initial_split)
  resamples = rsample::sliding_period(training, 
                                      index = date, 
                                      period = "month", 
                                      lookback = 12, 
                                      assess_stop = 3, 
                                      step = 3)
  
  
  initial_split_list = list(initial_split = initial_split,
                            training = training, 
                            testing = testing, 
                            resamples = resamples)
  
  return(initial_split_list)
}