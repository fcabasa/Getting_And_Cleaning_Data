Code Book
========
  
Raw data collection
-------------------
  
### Collection
  
  Raw data are obtained from UCI Machine Learning repository. In particular 
  we used the *Human Activity Recognition Using Smartphones Data Set*,
  that was used by the original collectors to conduct experiments exploiting
  Support Vector Machine (SVM).  Please refer to the README for download link.
    
  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48     years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,   STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded   
  accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at   a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The   
  obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was   
  selected for generating the training data and 30% the test data. 
  
  For each record it is provided:

  * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  * Triaxial Angular velocity from the gyroscope. 
  * A 561-feature vector with time and frequency domain variables. 
  * Its activity label. 
  * An identifier of the subject who carried out the experiment.

### Signals
  
  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a  Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  
    
  The set of variables that were estimated from these signals are:

*  mean(): Mean value
*  std(): Standard deviation
*  mad(): Median absolute deviation 
*  max(): Largest value in array
*  min(): Smallest value in array
*  sma(): Signal magnitude area
*  energy(): Energy measure. Sum of the squares divided by the number of values. 
*  iqr(): Interquartile range 
*  entropy(): Signal entropy
*  arCoeff(): Autoregression coefficients with Burg order equal to 4
*  correlation(): Correlation coefficient between two signals
*  maxInds(): Index of the frequency component with largest magnitude
*  meanFreq(): Weighted average of the frequency components to obtain a mean frequency
*  skewness(): Skewness of the frequency domain signal 
*  kurtosis(): Kurtosis of the frequency domain signal 
*  bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
*  angle(): Angle between some vectors.
    

    
Data transformation
-------------------
    
The raw data sets are processed with run_analisys.R script to create a tidy data set.
    
### Merge training and test sets
    
Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt,
subject_test.txt) and activity ids (y_train.txt, y_test.txt) are merged to obtain
a single data set. Variables are labeled with the names assigned by original
collectors (features.txt).
    
### Extract mean and standard deviation variables
    
From the merged data set is extracted and intermediate data set with only the
values of estimated mean (variables with labels that contain "mean") and standard
deviation (variables with labels that contain "std").
    
### Use descriptive activity names
    
A new column is added to intermediate data set with the activity description.
Activity id column is used to look up descriptions in activity_labels.txt.
    
### Label variables appropriately
    
Labels given from the original collectors were changed:
* to obtain valid R names without parentheses, dashes and commas
* to obtain more descriptive labels
    
### Create a tidy data set
    
From the intermediate data set is created a final tidy data set where numeric
variables are averaged for each activity and each subject.

The intermediate data set (all_data_mean_std.txt) contains 10299 observations with 81 variables accounting for only those variables which capture mean or standard deviation and all of the
individual observations for the 30 subjects across six activities.
    
The final tidy data set contains 180 observations with 81 variables divided in:
    
*  an activity label for the six activities (__Activity__): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
*  an identifier of the subject who carried out the experiment (__Subject__):
   ranging from 1 to 30
*  a 79-feature vector with time and frequency domain signal variables (numeric) for those
  variables which capture mean or standard deviation
    
The following table relates the 17 signals to the names used as prefix for the
variables names present in the data set. ".XYZ" denotes three variables, one for each axis.
    
Name                                  | Time domain                                 | Frequency domain
------------------------------------- | ------------------------------------------- | ------------------------------------------------
Body Acceleration                     | TimeDomain.BodyAcceleration.XYZ             |  FrequencyDomain.BodyAcceleration.XYZ
Gravity Acceleration                  | TimeDomain.GravityAcceleration.XYZ          |
Body Acceleration Jerk                | TimeDomain.BodyAccelerationJerk.XYZ         |  FrequencyDomain.BodyAccelerationJerk.XYZ
Body Angular Speed                    | TimeDomain.BodyAngularSpeed.XYZ             |  FrequencyDomain.BodyAngularSpeed.XYZ
Body Angular Acceleration             | TimeDomain.BodyAngularAcceleration.XYZ      |
Body Acceleration Magnitude           | TimeDomain.BodyAccelerationMagnitude        |  FrequencyDomain.BodyAccelerationMagnitude
Gravity Acceleration Magnitude        | TimeDomain.GravityAccelerationMagnitude     |
Body Acceleration Jerk Magnitude      | TimeDomain.BodyAccelerationJerkMagnitude    |  FrequencyDomain.BodyAccelerationJerkMagnitude
Body Angular Speed Magnitude          | TimeDomain.BodyAngularSpeedMagnitude        |  FrequencyDomain.BodyAngularSpeedMagnitude
Body Angular Acceleration Magnitude   | TimeDomain.BodyAngularAccelerationMagnitude |  FrequencyDomain.BodyAngularAccelerationMagnitude
    
For variables derived from mean and standard deviation estimation, the previous labels
are augmented with the terms "Mean" or "StandardDeviation".
    
The final tidy data set is written to the file all_data_avg_by_act_sub.txt.
    