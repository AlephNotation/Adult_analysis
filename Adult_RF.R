#Regression Tree - V1.0 - Long Hair Hommage 
source('DemystData_Prep2.R')
library(randomForest)

is.na(train) = train=='?'
is.na(train) = train==' ?'
train = na.omit(train)

is.na(test) = test=='?'
is.na(test) = test==' ?'
test = na.omit(test)


rf1 <- randomForest(income~., data = train, importance=TRUE)


test$nnpred <- NULL

test$rf<-predict(rf1, newdata=test, type="prob")


conf.rf <-table(predict(rf1, newdata=test, type="response"),test$income)
conf.rf
conf.rf[1,2] + conf.rf[2,1]


tune.rf <- tuneRF(train[-13], train$income, ntreeTry = 1000, stepFactor = 1, improve=0.01, trace=T, plot=T, dobest=F)

rf2 <-randomForest(income~., data=train, mtry=3, ntree = 1000, keep.forest=T, importance =T, test=test )
rf2.preds <-predict(rf2, type="prob", newdata =test)[,2]
rf2.pred <- prediction(rf2.preds, test$income)
rf2.perf <- performance(rf2.pred, "tpr", "fpr")
plot(rf2.perf, main="ROC Cruve for Second Random Forest Model", col=4, lwd=2)
abline(a=0, b=1, lwd=2, lty=2, col="gray")


imp <- importance(rf2, type=1)

featureImportance <- data.frame(Feature=row.names(imp), Importance=imp[,1])
p <- ggplot(featureImportance, aes(x=reorder(Feature, Importance), y=Importance)) +
  geom_bar(stat="identity", fill="#53cfff") +
  coord_flip() + 
  theme_light(base_size=20) +
  xlab("Importance") +
  ylab("") + 
  ggtitle("Random Forest Feature Importance\n") +
  theme(plot.title=element_text(size=18))

p
importance(rf2)
varImpPlot(rf2)

table(predict(rf2, newdata=test, type="response"),test$income)
