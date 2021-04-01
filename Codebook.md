---
title: "Codebook R Project Submission"
author: "J.Y.R. Cornejo"
date: "01/04/2021"
output:
  "DataSet.txt"
---

## Project Description
The goal is to prepare tidy data that can be used for later analysis.

##Creating the tidy datafile

###Guide to create the tidy data file
1. Merges the training and the test sets to create one data set.
2. Uses descriptive activity names to name the activities in the data set
3. Appropriately labels the data set with descriptive variable names. 
4. Create a tidy data set with the average of each variable for each activity and each subject. 

##Description of the variables in the run_analysis.R script
##Assign each data to variables

#directory of the test
test_path <- "./test/"
#directory of the train
train_path <- "./train/"
#activity label text file
activity_labels_file <- "activity_labels.txt"
#feature text file
features_names_file <- "features.txt"

#test text file containing the features
x_test_file <- paste0(test_path,"X_test.txt")
#test text file containing the target
y_test_file <- paste0(test_path,"y_test.txt")
#subject test text file 
subject_test_file <- paste0(test_path,"subject_test.txt")

#train text file containing the features
x_train_file <- paste0(train_path,"X_train.txt")
#train text file containing the target
y_train_file <- paste0(train_path,"y_train.txt")
#subject train text file 
subject_train_file <- paste0(train_path,"subject_train.txt")

#contains all the codes and labels 
activity_labels 

#contains all the features names
features_names 

#contains all the samples from the test data
x_test
#contains all the samples from the test data
y_test 
#contains all the subjects from the test data
subject_test 

#contains all the samples from the train data
x_train 
#contains all the samples from the train data
y_train 
#contains all the subjects from the train data
subject_train 

#Merges the training and the test sets to create one data set
data <- rbind(train,test)
#Extracts only the measurements on the mean and standard deviation for each measurement.
measure_df <- mutate()
#Uses descriptive activity names to name the activities in the data set
des_data <- merge()
#Create a tidy data set with the average of each variable for each activity and each subject. 
tidy_data <- aggregate()

##Sources
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  