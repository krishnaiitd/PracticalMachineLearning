## R code for Practial Machine Learning Course####
# Check the available files in this directory
# dir()
# Load the training data
testingdf <- read.csv("pml-testing.csv");
trainingdf <- read.csv("pml-training.csv");
# exclude the obvious columns i.e "X", "user_name", "raw_timestamp_part_1", "raw_timestamp_part_2", "cvtd_timestamp"
excludecolumns <- c("X", "user_name", "raw_timestamp_part_1", "raw_timestamp_part_2", 
                    "cvtd_timestamp", "new_window")
getDataExcludingSomeColumns  <- function(tdata, excludecolumns) {
        exdata <- tdata[, !(names(tdata) %in% excludecolumns)]
        exdata
}
trainingdf <- getDataExcludingSomeColumns(trainingdf, excludecolumns)
## convert the data frame into matrix
#trainingdf <- data.matrix(trainingdf)
## process the data
processedData <- function(rawdata) {
        # for each columns NA should be replaced with average of that columns
        for(column in names(rawdata)) {               
                if(column == "classe") {
                        next;
                }
                columnValue <- as.numeric(rawdata[,column]);
                avgColumnValue <- mean(columnValue, na.rm=TRUE)
                minColumnValue <- min(columnValue, na.rm=TRUE)
                maxColumnValue <- max(columnValue, na.rm=TRUE)
                columnValue[is.na(columnValue)] <- avgColumnValue
                for(i in 1:length(columnValue)) {
                        columnValue[i] <- round((columnValue[i] - minColumnValue) / (maxColumnValue - minColumnValue), 4);
                }
                rawdata[,column] <- columnValue
        }
        rawdata
}

trainingdf <- processedData(trainingdf)
## Get the processed training data frame
#trainingdf <- processedData(trainingdf)
## fit in a model
#library(caret); 
#library(kernlab); 
#inTrain  <- createDataPartition(y=trainingdf['classe'], p=0.80, list=FALSE)
#training <- trainingdf[inTrain,]
#testing  <- trainingdf[-inTrain,]
# Fit a model
if(class(trainingdf) != 'matrix') {
        training <- data.matrix(trainingdf)
}
#class(trainingdf)
#modelFit <- train(type ~.,data=trainingdf, method="glm")


library(e1071)
library(rpart)
svm.model <- svm(type ~., data = trainingdf, cost = 100, gamma = 1)





