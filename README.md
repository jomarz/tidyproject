# Course Project
# Getting and Cleaning Data

 It is important to keep the directory structure as provided:
 the directory "UCI HAR Dataset" should be in your working directory
 this directory contains all the files and subdirectories as provided by the course


 the output data frame is found in the file assignment2tidy.txt

# Please see the codebook in the file CodeBook.md that describes what the column names mean


 The script run_analysis.R when open and run in R, reads the provided data frames
 from the Samsung Galaxy S training and test and merges it into one data frame that 
 only takes into account the columns for means and standard deviations of the variables
 It it also merged with the activities and numbers of each of the participating subjects

# Step by step, the code does this:


 merge all the train data horizontally

 merge all the test data horizontally

 subset the train and test data frames taking only the means and standard deviations
 variables we do this by subseting taking only the columns that correspond to variable 
 names containing -mean()- and -std()-

 We merge the two datasets by rows (vertically one after the other)

 set the variable names from the features.txt file as the column names
 in the merged data set, first taking only the means and stds

head(mergedDF)

#We now export the merged data frame to a text file
write.table(mergedDF, "assignment2tidy.txt", row.name=FALSE)
