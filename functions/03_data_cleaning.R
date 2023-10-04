data_cleaning = function(raw_data){
  
  initial_split = rsample::initial_time_split(raw_data, prop = 0.8)
  
  training = rsample::training(initial_split)
  testing = rsample::testing(initial_split)
  
  initial_split_list = list(training = training, testing = testing)
  
  return(initial_split_list)
}