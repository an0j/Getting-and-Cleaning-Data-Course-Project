

# Name: Jona Villanueva
# run_analysis.R




#load library

library(dplyr)


# Download the file

filename <- "project.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, filename)


# Unzip the downloaded file

unzip(filename)


# Setting data path

dataPath <- "UCI HAR Dataset"


# Reading text files

subjectTrain <- read.table(file.path(dataPath, "train", "subject_train.txt"))
XTrain <- read.table(file.path(dataPath, "train", "X_train.txt"))
yTrain <- read.table(file.path(dataPath, "train", "y_train.txt"))

subjectTest <- read.table(file.path(dataPath, "test", "subject_test.txt"))
XTest <- read.table(file.path(dataPath, "test", "X_test.txt"))
yTest <- read.table(file.path(dataPath, "test", "y_test.txt"))

activity <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activity) <- c("activityId", "activityLabel")

features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)


# 1. Merge test and training set

oneDataSet <- rbind(cbind(subjectTrain, XTrain, yTrain), cbind(subjectTest, XTest, yTest))
colnames(oneDataSet) <- c("subject", features[,2], "activity")


# 2. Extraction of mean and std columns; and update oneDataSet

extractColumn <- grepl("subject|activity|mean|std", colnames(oneDataSet))
oneDataSet <- oneDataSet[ , extractColumn]


# 3. Use descriptive names to name the activities in the data set

oneDataSet$activity <- factor(oneDataSet$activity, levels = activity[, 1], labels = activity[, 2])


# 4. Use approriate labels in the variable names

oneDataSetColNames <- colnames(oneDataSet)
oneDataSetColNames <- gsub("[\\(\\)-]", "", oneDataSetColNames)

oneDataSetColNames <- gsub("^f", "frequencyDomain", oneDataSetColNames)
oneDataSetColNames <- gsub("^t", "timeDomain", oneDataSetColNames)
oneDataSetColNames <- gsub("Acc", "Accelerometer", oneDataSetColNames)
oneDataSetColNames <- gsub("Gyro", "Gyroscope", oneDataSetColNames)
oneDataSetColNames <- gsub("Mag", "Magnitude", oneDataSetColNames)
oneDataSetColNames <- gsub("Freq", "Frequency", oneDataSetColNames)
oneDataSetColNames <- gsub("mean", "Mean", oneDataSetColNames)
oneDataSetColNames <- gsub("std", "StandardDeviation", oneDataSetColNames)
oneDataSetColNames <- gsub("BodyBody", "Body", oneDataSetColNames)

colnames(oneDataSet) <- oneDataSetColNames


# 5. Create tidy data set with average of each variable for each activity and each subject

oneDataSetGrouped <- group_by(oneDataSet, subject, activity)
oneDataSetMean <- summarize_each(oneDataSetGrouped, funs = mean)

write.table(oneDataSetMean, "tidyData.txt", row.names = FALSE, quote = FALSE)

