library(e1071)
library(rpart)

rawdata <- iris
#print(rawdata['Species'])
model <- svm(rawdata$Species ~., rawdata)
result <- predict(model, newdata = iris)

test <- iris[c(30, 90),] # select few row...

## remove Specified class
test = subset(test, select = -Species)
## Predict 

y <- predict(model, newdata=test)
## checking result.
y
