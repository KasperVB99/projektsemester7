calculate_accuracy = function(predictions, actual){
  names = c("logit", "knn", "decision_tree")
  row_names = c("Actually Positive", "Actually Negative", "Class Prediction")
  col_names = c("Predicted Positive", "Predicted Negative", "Class Recall")
  evaluation = list()
  
  for (x in 1:(length(predictions))){
    confusion = caret::confusionMatrix(data = predictions[[x]]$.pred_class,
                                       reference = actual)
    
    pos_pred_value = confusion$byClass["Pos Pred Value"]
    neg_pred_value = confusion$byClass["Neg Pred Value"]
    sensitivity = confusion$byClass["Sensitivity"]
    specificity = confusion$byClass["Specificity"]
    accuracy = confusion$overall["Accuracy"]
    
    conf_mat = cbind(rbind(confusion$table, c(sensitivity, specificity)), 
                     c(pos_pred_value, neg_pred_value, accuracy))
    
    col_names = c("Actually Negative", "Actually Positive", "Class Prediction")
    row_names = c("Predicted Negative", "Predicted Positive", "Class Recall")
    
    rownames(conf_mat) = row_names
    colnames(conf_mat) = col_names
    
    evaluation[[x]] = list(conf_mat = conf_mat,
                           measures = confusion)
    
  }
  
  names(evaluation) = names
  
  return(evaluation)
  
}
