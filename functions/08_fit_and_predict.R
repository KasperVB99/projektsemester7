fit_and_predict = function(finalized_workflows, split_data){
  library(tidymodels)
  
  logit_workflow = finalized_workflows$finalized_logit_workflow
  knn_workflow = finalized_workflows$finalized_knn_workflow
  decision_tree_workflow = finalized_workflows$finalized_decision_tree_workflow
  
  logit_fit = fit(logit_workflow, data = split_data$training)
  logit_is_predict = predict(logit_fit, new_data = split_data$training)
  logit_oos_predict = predict(logit_fit, new_data = split_data$testing)
  
  knn_fit = fit(knn_workflow, data = split_data$training)
  knn_is_predict = predict(knn_fit, new_data = split_data$training)
  knn_oos_predict = predict(knn_fit, new_data = split_data$testing)
  
  decision_tree_fit = fit(decision_tree_workflow, data = split_data$training)
  decision_tree_is_predict = predict(decision_tree_fit, new_data = split_data$training)
  decision_tree_oos_predict = predict(decision_tree_fit, new_data = split_data$testing)
  
  fitted_models = list(logit_fit = logit_fit,
                       knn_fit = knn_fit,
                       decision_tree_fit = decision_tree_fit)
  
  in_sample_predictions = list(logit_is_predict = logit_is_predict,
                               knn_is_predict = knn_is_predict,
                               decision_tree_is_predict = decision_tree_is_predict)
  
  out_of_sample_predictions = list(logit_oos_predict = logit_oos_predict,
                                   knn_oos_predict = knn_oos_predict,
                                   decision_tree_oos_predict = decision_tree_oos_predict)
  
  fitted_and_predicted = list(fitted_models = fitted_models,
                              in_sample_predictions = in_sample_predictions,
                              out_of_sample_predictions = out_of_sample_predictions)
  
  return(fitted_and_predicted)
}