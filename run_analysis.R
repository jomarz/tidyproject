## It is important to keep the directory structure as provided:
## the directory "UCI HAR Dataset" should be in your working directory
## this directory contains all the files and subdirectories as provided by the course

pathTrain <- "UCI HAR Dataset/train/X_train.txt"
pathActTrain <- "UCI HAR Dataset/train/y_train.txt"
pathSubTrain <- "UCI HAR Dataset/train/subject_train.txt"
pathTest <- "UCI HAR Dataset/test/X_test.txt"
pathActTest <- "UCI HAR Dataset/test/y_test.txt"
pathSubTest <- "UCI HAR Dataset/test/subject_test.txt"

activitiesPath <- "UCI HAR Dataset/activity_labels.txt"
namesPath <- "UCI HAR Dataset/features.txt"

## We read the files into objects
train <- read.table(pathTrain)
trainActs <- read.table(pathActTrain)
trainSubjects <- read.table(pathSubTrain)
test <- read.table(pathTest)
testActs <- read.table(pathActTest)
testSubjects <- read.table(pathSubTest)
varNames <- read.table(namesPath)
actLabels <- read.table(activitiesPath)

## Set the column names of the Activities and Subjects vectors
colnames(trainActs)[1] <- "Activity"
colnames(trainSubjects)[1] <- "Subject"
colnames(testActs)[1] <- "Activity"
colnames(testSubjects)[1] <- "Subject"

## Set the variable names from the features.txt file as the column names
colnames(train) <- as.character(varNames$V2)
colnames(test) <- as.character(varNames$V2)

## Subset the train and test data frames taking only the means and standard deviations
## variables we do this by subseting taking only the columns that correspond to variable 
## names containing "mean()" and "std()"
trainSub <- train[,grep("mean\\(\\)|std\\(\\)",colnames(train))]
testSub <- test[,grep("mean\\(\\)|std\\(\\)",colnames(test))]

## Merge all the train data horizontally
trainSub <- cbind(trainSub, trainActs, trainSubjects)
## Merge all the test data horizontally
testSub <- cbind(testSub, testActs, testSubjects)

## We merge the two datasets by rows (vertically one after the other)
mergedDF <- rbind(trainSub, testSub)

## Name the activity in each observation according to activity_labels.txt
mergedDF$Activity <- sapply(mergedDF$Activity, function(x) actLabels[actLabels$V1==x, 2])

library(reshape2)

nbr <- length(colnames(mergedDF))-2

dataMelt <- melt(mergedDF, id=c("Subject", "Activity"), measure.vars=colnames(mergedDF)[c(1:nbr)])

## Summarize taking the mean for each combination of Subject, Activity and variable
tidy <- dcast(dataMelt, Subject + Activity ~ variable, mean)

#We now export the merged data frame to a text file
write.table(tidy, "assignment2tidy.txt", row.name=FALSE)
