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

## We then read the files
train <- read.table(pathTrain)
tainActs <- read.table(pathActTrain)
trainSubjects <- read.table(pathSubTrain)
test <- read.table(pathTest)
testActs <- read.table(pathActTest)
testSubjects <- read.table(pathSubTest)
varNames <- read.table(namesPath)

## merge all the train data horizontally
train <- cbind(train, tainActs, trainSubjects)

## merge all the test data horizontally
test <- cbind(test, testActs, testSubjects)

## subset the train and test data frames taking only the means and standard deviations
## variables we do this by subseting taking only the columns that correspond to variable 
## names containing -mean()- and -std()-
train <- train[,grep("-mean\\(\\)-|-std\\(\\)-",varNames$V2)]
test <- test[,grep("-mean\\(\\)-|-std\\(\\)-",varNames$V2)]

## We merge the two datasets by rows (vertically one after the other)
mergedDF <- rbind(train, test)

## set the variable names from the features.txt file as the column names
## in the merged data set, first taking only the means and stds
variables <- (varNames$V2[varNames$V2==grep("-mean\\(\\)-|-std\\(\\)-",varNames$V2),2])
colnames(mergedDF) <- c(variables, "Activity", "Subject")

head(mergedDF)

#We now export the merged data frame to a text file
write.table(mergedDF, "assignment2tidy.txt", row.name=FALSE)
