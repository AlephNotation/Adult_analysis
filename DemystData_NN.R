# Predictive Neural Network - V1.0 - Sleepy Turtle
setwd("C:/Users/Shane/Desktop")
source('DemystData_Prep2.R')

set.seed(9000)
library(nnet)

nn1 <- nnet(income~., data = train, size=20,MaxNWts=2000, maxit=10000, decay=.001)


#Compute the confusion matrix
# True Positive    False Negative
# False Positive   True Negative
table(test$income,predict(nn1,newdata=test,type="class"))

test$nnpred <- predict(nn1,newdata=test,type="class")

nn.preds = predict(nn1,newdata=test,type="raw")
nn.pred = prediction(nn.preds, test$income)
nn.perf = performance(nn.pred,"tpr","fpr")

plot(nn.perf, col=3, lwd=2, main="ROC Curve for Neural Network") 
abline(a=0,b=1,lwd=2,lty=2,col="gray")

plot(rf2, type="simple")

nn.preds