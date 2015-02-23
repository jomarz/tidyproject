# Course Project
# Getting and Cleaning Data

 It is important to keep the directory structure as provided:
 the directory "UCI HAR Dataset" should be in your working directory
 this directory contains all the files and subdirectories as provided by the course

# Data Frame output .txt file
The output data frame is found in the file assignment2tidy.txt

# Please see the codebook in the file CodeBook.md that describes what the column names mean


 The script run_analysis.R when open and run in R, reads the provided data frames
 from the Samsung Galaxy S training and test and merges it into one data frame that 
 only takes into account the columns for means and standard deviations of the variables
 It it also merged with the activities and identifying numbers of each of the participating subjects
 The final data frame outputed is summarizes the mean values of the measurements for each Activity/Subject combination

# Step by step, the code does this:


Set the column names of the Activities and Subjects vectors


Set the variable names from the features.txt file as the column names


Subset the train and test data frames taking only the means and standard deviations
variables we do this by subseting taking only the columns that correspond to variable 
names containing "mean()" and "std()"


Merge all the train data horizontally

Merge all the test data horizontally


Merge the two datasets by rows (vertically one after the other)


Name the activity in each observation according to activity_labels.txt


Summarize taking the mean for each combination of Subject, Activity and variable


Export the merged data frame to a text file