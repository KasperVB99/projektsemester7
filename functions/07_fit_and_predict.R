fit_and_predict = function(defined_workflows, split_data){
  logit_workflow = defined_workflows$logit_workflow
  knn_workflow = defined_workflows$knn_workflow
  training = split_data$training
  testing = split_data$testing
  
  logit_fit = parsnip::fit(logit_workflow, training)
  logit_prediction = stats::predict(object = logit_fit, new_data = testing)
  
  logit_fit_and_predict = list(logit_fit = logit_fit,
                               logit_prediction = logit_prediction)
  
  knn_fit = parsnip::fit(knn_workflow, training)
  knn_prediction = stats::predict(object = knn_fit, new_data = testing)
  
  knn_fit_and_predict = list(knn_fit = knn_fit,
                             knn_prediction = knn_prediction)
  
  fit_and_predict = list(logit_fit_and_predict = logit_fit_and_predict,
                         knn_fit_and_predict = knn_fit_and_predict)
  
  return(fit_and_predict)
}