#Logistic regression model - V1.1 - Trick or Treat 

set.seed(9000)
getwd()
source('DemystData_Prep3.R')
library(car)

reg1 = glm(income ~ ., family=binomial(logit), data=train)
test$pred1 <- predict(reg1,test,type="response")
test$results1 <- ifelse(test$pred1 >.5, 1, 0)
treat1 <- summary(as.factor(test$results1))
trick1 <- summary(as.factor(test$income))

treat1
trick1
#Positive Predictive Value
PPV1 = trick1[2] / treat1[2]
PPV1

#negative predictive value
NPV1 = trick1[1] /treat1[1]
NPV1
reg1sw = step(fit1)  # Keeps all variables


vif(reg1)
reg1.5= glm(income ~.-relationship, family = binomial(logit),  data = train)
vif(reg1.5)

test$pred1.5 <- predict(reg1.5,test,type="response")
test$results1.5<- ifelse(test$pred1.5 >.5, 1, 0)
durbinWatsonTest(reg1.5)

 
reg2= glm(income ~.-relationship -type_employer, family = binomial(logit), data = train)

vif(reg2)
durbinWatsonTest(reg2)
pred2 <- predict(reg2,test,type="response")
test$results2 <- ifelse(test$pred2 >.48, 1, 0)
conf_matrix2 <- as.matrix(table(factor(test$results2>0.5, levels=c(F, T)), test$income))
conf_matrix2
conf_matrix2[1,2] +conf_matrix2[2,1]


trick2 <- summary(as.factor(test$income))
treat2 <- summary(as.factor(test$results2))

treat2
trick2
#Positive Predictive Value
PPV2 = trick2[2] / treat2[2]
PPV2

#negative predictive value
NPV2 = trick2[1] /treat2[1]
NPV2

#confusion matrix function
confused <- function(pred){
  conf_matrix <- as.matrix(table(factor(test$pred>0.5, levels=c(F, T)), test$income))
  conf_matrix
}
confused(results1)
confused(results1.5)
confused(test$results2)

conf_matrix1 <- as.matrix(table(factor(test$results1>0.5, levels=c(F, T)), test$income))
conf_matrix1

conf_matrix1.5 <- as.matrix(table(factor(test$results1.5>0.5, levels=c(F, T)), test$income))
conf_matrix1.5


table(as.factor(predict(reg2,newdata=test,type="response")), test$income)

library(ROCR)
fitpreds = predict(reg1.5,newdata=test,type="response")
fitpred = prediction(fitpreds,test$income)
fitperf = performance(fitpred, "tpr", "fpr")

rf.preds = predict(rf1,type="prob",newdata=train)[,2]
rf.pred = prediction(rf.preds, test$income)
rf.perf = performance(rf.pred,"tpr","fpr")

plot(fitperf,col=2,lwd=2,main="ROC Curve for Logistic Model")
abline(a=0,b=1,lwd=2,lty=2,col="gray")

plot(rf.perf,col=3,lwd=2,add=T)
# Plotting ROC Curves 

plot(fitperf, col=2, lwd=2, main ="ROC Curve for All Classifiers")
plot(nn.perf, col=3, lwd=2, add=T) 
plot(rf2.perf, col=4, lwd=2, add=T)
abline(a=0,b=1,lwd=2,lty=2,col="gray")
legend("bottomright",col=c(2:4),lwd=2,legend=c("Logit","Neural Net", "RF2"),bty='n')


