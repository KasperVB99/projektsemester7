data_splitting = function(raw_data){
  
  initial_split = rsample::initial_time_split(raw_data, prop = 0.8, lag = 2)
  
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