model_evaluation = function(fitted_and_predicted, split_data, grid_results){
  in_sample_predictions = fitted_and_predicted$in_sample_predictions
  in_sample_actual = split_data$training$positive_oil_return
  out_of_sample_predictions = fitted_and_predicted$out_of_sample_predictions
  out_of_sample_actual = split_data$testing$positive_oil_return

  in_sample_accuracy = calculate_accuracy(in_sample_predictions, 
                                          in_sample_actual) 
  cv_accuracy = calculate_accuracy_cv(grid_results = grid_results)
  out_of_sample_accuracy = calculate_accuracy(out_of_sample_predictions, 
                                              out_of_sample_actual)
  
  
  accuracy = list(in_sample_accuracy = in_sample_accuracy,
                  cv_accuracy = cv_accuracy,
                  out_of_sample_accuracy = out_of_sample_accuracy)
  
  return(accuracy)
}
