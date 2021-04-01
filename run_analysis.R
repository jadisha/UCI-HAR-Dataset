library(dplyr)

test_path <- "./test/"
train_path <- "./train/"
activity_labels_file <- "activity_labels.txt"
features_names_file <- "features.txt"

x_test_file <- paste0(test_path,"X_test.txt")
y_test_file <- paste0(test_path,"y_test.txt")
subject_test_file <- paste0(test_path,"subject_test.txt")

x_train_file <- paste0(train_path,"X_train.txt")
y_train_file <- paste0(train_path,"y_train.txt")
subject_train_file <- paste0(train_path,"subject_train.txt")

activity_labels <- read.table(activity_labels_file,header = FALSE,col.names = c("target", "label"))
features_names <- read.table(features_names_file,header = FALSE,col.names = c("number", "name"))

x_test <- read.table(x_test_file,header = FALSE,col.names = c(features_names[,'name']))
y_test <- read.table(y_test_file,header = FALSE,col.names = c("target"))
subject_test <- read.table(subject_test_file,header = FALSE,col.names = c("subject"))

x_train <- read.table(x_train_file,header = FALSE, col.names = c(features_names[,'name']))
y_train <- read.table(y_train_file,header = FALSE,col.names = c("target"))
subject_train <- read.table(subject_train_file,header = FALSE,col.names = c("subject"))

#1 Merges the training and the test sets to create one data set.

test <- cbind(subject_test,x_test,y_test)
train <- cbind(subject_train,x_train,y_train)

data <- rbind(train,test)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.

measure_df <- mutate(data, subject_mean = mean(data$"subject"), target_mean = mean(data$"target"))

#3 Uses descriptive activity names to name the activities in the data set
des_data <- merge(data,activity_labels,"target")

#4 Appropriately labels the data set with descriptive variable names. 
names(des_data)<-gsub("Acc","Accelerometer",names(des_data))
names(des_data)<-gsub("angle","Angle",names(des_data))
names(des_data)<-gsub("Mag","Magnitude",names(des_data))
names(des_data)<-gsub("Mag","Magnitude",names(des_data))
names(des_data)<-gsub("Gyro", "Gyroscope", names(des_data))
names(des_data)<-gsub("tBody", "TimeBody", names(des_data))
names(des_data)<-gsub("^f", "Frequency", names(des_data))
names(des_data)<-gsub("^t", "Time", names(des_data))
names(des_data)[1]<-"code"
names(des_data)[564]<-"activity"

#5
tidy_data <- aggregate(des_data,list(des_data$subject,des_data$activity),mean,na.action = na.omit)
write.table(tidy_data, "DataSet.txt", row.name=FALSE)

str(tidy_data)


