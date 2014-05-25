## This script merges data from a number of .txt files and produces 
## a tidy data set which may be used for further analysis.


## required libraries
library(reshape2)


## ----------------- load lables for "activity" and "feature" ---------------
## Read all activities and their names and label the aproppriate columns 
activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))

## Read the dataframe's column names
feature_lables <- read.table("features.txt", col.names=c("feature_id", "feature_name"))
feature_names <-  feature_lables[,2]


## ----------------- for the test data set --------------------------------
## Read the test data and label the dataframe's columns
testdata <- read.table("./test/X_test.txt")
colnames(testdata) <- feature_names

## Read the ids of the test subjects and label the the dataframe's columns
test_subject_id <- read.table("./test/subject_test.txt")
colnames(test_subject_id) <- "subject_id"

## Read the activity id's of the test data and label the the dataframe's columns
test_activity_id <- read.table("./test/y_test.txt")
colnames(test_activity_id) <- "activity_id"


## test data into one dataframe
test_data <- cbind(test_subject_id , test_activity_id , testdata)



## ------------ for the train data set ------------------------------------    
## Read the training data and label the dataframe's columns
traindata <- read.table("./train/X_train.txt")
colnames(traindata) <- feature_names

## Read the ids of the test subjects and label the the dataframe's columns
train_subject_id <- read.table("./train/subject_train.txt")
colnames(train_subject_id) <- "subject_id"

## Read the activity id's of the training data and label 
##the dataframe's columns
train_activity_id <- read.table("./train/y_train.txt")
colnames(train_activity_id) <- "activity_id"

## train data into one dataframe
train_data <- cbind(train_subject_id , train_activity_id , traindata)


## ------------- combine data set and select "mean" and "std" features -------   

all_data <- rbind(train_data,test_data)

##Keep only columns refering to mean() or std() values
mean_col_idx <- grep("mean",names(all_data),ignore.case=TRUE)
mean_col_names <- names(all_data)[mean_col_idx]
std_col_idx <- grep("std",names(all_data),ignore.case=TRUE)
std_col_names <- names(all_data)[std_col_idx]
mean_std_data <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]

## --------------- add descriptive activity labels ----------------
##to get one dataset with descriptive activity names
descrnames <- merge(activity_labels, mean_std_data, by="activity_id", all=TRUE)

## delete the "id" because we have already descriptives
data_melt$activity_id <- NULL


## --------------- output tidy data set ---------------------------

## Melt the dataset with the descriptive activity names
data_melt <- melt(descrnames,id=c("activity_name", "subject_id"))

## Cast the melted dataset according to the average of each variable 
## for each activity and each subject
output_data <- dcast(data_melt, activity_name + subject_id ~ variable, mean)

## Create a file with the new tidy dataset
write.table(output_data,"./tidy_movement_data.txt")


