# Load library
library(dplyr)

#Download UCI HAR Dataset from url
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "UCI HAR Dataset.zip"

if (!file.exists(zipfile)) {
  download.file(Url, zipfile, mode = "wb")
}

#Unzip downloaded dataset
path <- "UCI HAR Dataset"
if (!file.exists(path)) {
  unzip(zipfile)
}

#Extract each dataset needed from the file to merge and label the dataset
xtest = read.table("UCI HAR Dataset/test/X_test.txt", header= FALSE) 
ytest = read.table("UCI HAR Dataset/test/Y_test.txt",header= FALSE)
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt", header= FALSE)

xtrain = read.table("UCI HAR Dataset/train/X_train.txt", header= FALSE)
ytrain = read.table("UCI HAR Dataset/train/Y_train.txt", header= FALSE)
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt", header= FALSE)

features = read.table("UCI HAR Dataset/features.txt", header = FALSE)
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Assign Descriptive column names for each dataset
colnames(activity_labels) = c("activity_code", "activity")
colnames(xtest) = features[,2]
colnames(ytest) = "activity_code"
colnames(subject_test) = "subject_code"
colnames(xtrain) = features[,2]
colnames(ytrain) = "activity_code"
colnames(subject_train) = "subject_code"

#Merge all x, y and subject datasets in to one full dataset
X_data = rbind(xtest, xtrain)
Y_data = rbind(ytest, ytrain)
Subject_data = rbind(subject_test, subject_train)

Full_dataset = cbind(Subject_data, Y_data, X_data)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
colNames = colnames(Full_dataset)

mean_and_std = (grepl("activity_code" , colNames) | grepl("subject_code" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))

meanandstd <- Full_dataset[ , mean_and_std == TRUE]

#Uses descriptive activity names to name the activities in the data set
meanandstd$activity_code <- activity_labels[meanandstd$activity_code, 2]

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyDataset <- meanandstd[order(meanandstd$subject_code, meanandstd$activity_code),]

# Writing second tidy data set into a txt file
write.table(TidyDataset, "TidyDataSet.txt", row.names = FALSE)
  

