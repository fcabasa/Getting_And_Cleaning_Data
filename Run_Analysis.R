##################################################################################################
# Name: Frederick Cabasa
# Date: January 22, 2017
# Class: Getting and Cleaning Data
# INSTRUCTIONS FOR ASSIGNMENT 4:
#
#  A full description is available at this site:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Here are the data for the project:

##  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##  In R, use the download.file function:
##  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./Smartphones.zip")

## You should create one R script called run_analysis.R that does the following:

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement.
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names.
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require(plyr)

#**********************
# Step 0: Load raw data
#**********************

features <- read.table("features.txt", colClasses = c("character"))
activity_labels <- read.table("activity_labels.txt", col.names = c("ActivityId", "Activity"))
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

#*********************************************************************
# Step 1: Merge the training and the test sets to create one data set.
#*********************************************************************
 
# Combine training and test data
training_data <- cbind(cbind(X_train, subject_train), y_train)
test_data <- cbind(cbind(X_test, subject_test), y_test)
all_data <- rbind(training_data, test_data)

# Create label columns
all_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(all_data) <- all_labels

#*******************************************************************************************
# Step 2: Extract only the measurements on the mean and standard deviation for each measurement
#*******************************************************************************************

all_data_mean_std <- all_data[,grepl("mean|std|Subject|ActivityId", names(all_data))]

#*******************************************************************************
# Step 3: Uses descriptive activity names to name the activities in the data set
#*******************************************************************************

all_data_mean_std <- join(all_data_mean_std, activity_labels, by = "ActivityId", match = "first")
all_data_mean_std <- all_data_mean_std[,-1]

#*****************************************************************
# Step 4: Appropriately label the data set with descriptive names
#*****************************************************************

names(all_data_mean_std) <- gsub('\\(|\\)',"",names(all_data_mean_std), perl = TRUE)
names(all_data_mean_std) <- make.names(names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Acc',"Acceleration",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('GyroJerk',"AngularAcceleration",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Gyro',"AngularSpeed",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Mag',"Magnitude",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('^t',"TimeDomain.",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('^f',"FrequencyDomain.",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('\\.mean',".Mean",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('\\.std',".StandardDeviation",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Freq\\.',"Frequency.",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Freq$',"Frequency",names(all_data_mean_std))

#*********************************************************************************************************************
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
#********************************************************************************************************************
all_data_avg_by_act_sub <- ddply(all_data_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(all_data_avg_by_act_sub, file = "all_data_avg_by_act_sub.txt", row.name = FALSE)
