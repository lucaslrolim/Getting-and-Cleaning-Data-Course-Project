#Data Science Assignment - Getting and Cleaning Data Course Project

This course project use data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (UCI HAR Dataset in this repo)

##The project is a R script that do the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##Steps to work on this course project

- Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip on the same directory of this script

- Run the command "source("run_analysis.R")" on R or RStudio. This will generate a file named "AnalysisResult.txt"

##Some things about my approach to solve this problem

- Whenever possible I used native functions of R (avoiding dplyr and other dependencies);
- The regular expression "(.*)+mean()+(.*)|(.*)+std()+(.*)" can be better understended looking on this slide presentation: http://migre.me/twX0o
- Each code snippet has an explanatory comment just above;

