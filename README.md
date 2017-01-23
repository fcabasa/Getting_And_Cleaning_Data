{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf470
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
\margl1440\margr1440\vieww12540\viewh9120\viewkind0
\deftab720
\pard\pardeftab720\sl280\partightenfactor0

\f0\fs24 \cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 # Getting and Cleaning Data\
\
## Course Project\
\
You should create one R script called run_analysis.R that does the following.\
\
1. Merges the training and the test sets to create one data set.\
2. Extracts only the measurements on the mean and standard deviation for each measurement.\
3. Uses descriptive activity names to name the activities in the data set\
4. Appropriately labels the data set with descriptive activity names.\
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.\
\
## Steps to work on this course project\
\
1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.\
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.\
3. Run ```source("run_analysis.R")```, then it will generate a new file ```all_data_avg_by_act_sub``` in your working directory.\
\
## Dependencies\
\
```run_analysis.R``` file will help you to install the dependencies automatically. It depends on ```reshape2``` and ```data.table```. \
}