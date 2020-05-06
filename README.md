# Getting-and-Cleaning-Data-Course-Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

## Background

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Creating the Tidy Data

The R script run_analysis.R is used to create the data set. The general steps are as follows:
1. Download the zip file
2. Unzip the downloaded file
3. Read the text files
4. Merge the test and traning sets
5. Extract only the measurements on the mean and standard deviation for each measurement
6. Use descriptive activity names to name the activities in the data set.
7. Appropriately label the data set with descriptive variable names.
8. Create a second, independent tidy set with the average of each variable for each activity and each subject.


