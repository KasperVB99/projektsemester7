model_evaluation = function(fitted_and_predicted, split_data, tuned_models){
  in_sample_predictions = fitted_and_predicted$in_sample_predictions
  in_sample_actual = split_data$training$positive_oil_return
  out_of_sample_predictions = fitted_and_predicted$out_of_sample_predictions
  out_of_sample_actual = split_data$testing$positive_oil_return
  positive_percent = calculate_positive_return(split_data)
  
  in_sample_accuracy = calculate_accuracy(in_sample_predictions, in_sample_actual, positive_percent$mean_in_sample) 
  cv_accuracy = calculate_accuracy_cv(tuned_models, positive_percent$mean_cv)
  out_of_sample_accuracy = calculate_accuracy(out_of_sample_predictions, 
                                              out_of_sample_actual, positive_percent$mean_out_of_sample)
  
  
  accuracy = list(in_sample_accuracy = in_sample_accuracy,
                  cv_accuracy = cv_accuracy,
                  out_of_sample_accuracy = out_of_sample_accuracy)
  
  return(accuracy)
}
