# Getting and Cleaning Data

## Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1. Download the data source and put into a folder on your local drive. The file can be downloaded from this location:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
You'll have a ```UCI HAR Dataset``` folder created after you unzip the downloaded file.
2. Put ```Run_Analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.
3. Run ```source("Run_Analysis.R")```, then it will generate a new file ```all_data_avg_by_act_sub``` in your working directory.

## Dependencies

```Run_Analysis.R``` file will help you to install the dependencies automatically. It depends on ```plyr``` and ```data.table```. 
