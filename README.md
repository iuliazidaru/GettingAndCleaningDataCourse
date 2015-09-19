# GettingAndCleaningDataCourse
Project for Coursera course: "Getting and Cleaning data"

## Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script 

In R run
<code>
source("run_analysis.R")
</code>
The script will download and extract the raw data file (if it doesn't exist in the current directory). The output is generated in <code>"result.txt"</code>, also in the current directory.

## Raw data usage
The test and train set where used. They can be found in the 
<code>UCI HAR Dataset/test/</code> and <code>UCI HAR Dataset/train/</code> directories.
The following files where used:

* <code>UCI HAR Dataset/test/X_test.txt</code>contains the measurements in the test dataset(the 561 features that can be found in <code>UCI HAR Dataset/features.txt</code> file and described in  <code>UCI HAR Dataset/features_info.txt</code> file) 
* <code>UCI HAR Dataset/test/subject_test.txt </code> contains the subjects for the experiment in the test dataset
* <code>UCI HAR Dataset/test/y_test.txt</code> contains the activity id for each experiment in the test dataset (the activity id / activity label mapping can be found in <code>UCI HAR Dataset/activity_labels.txt</code> file)
 </code>

* <code>UCI HAR Dataset/train/X_train.txt</code> contains the measurements in the train dataset(the 561 features that can be found in <code>UCI HAR Dataset/features.txt</code> file and described in  <code>UCI HAR Dataset/features_info.txt</code> file)
* <code>UCI HAR Dataset/train/subject_train.txt </code> contains the subjects for the experiment in the train dataset
* <code>UCI HAR Dataset/train/y_train.txt</code> contains the activity id for each experiment in the train dataset (the activity id / activity label mapping can be found in <code>UCI HAR Dataset/activity_labels.txt</code> file)
 </code>

## Data Processing

The datasets where loaded in memory and merged to obtain a single subject/ activity / features dataset.
The columns in the features dataset received the names in the features.txt file. The paranthesis ("()") where removed to have better feature names.
The column name in the subject file was named "subject" and the column in activity file was named "activity".

The columns in the three datasets were put together to obtain a new dataset with subject, activity and all other features columns.

The duplicated columns were removed.

The columns containing "mean" and "std" were selected. The columns containg angle where removed(not necessary).

In the activity column, the activity ids were replaced with the activity names found in activity_labels.txt file.

The data was grouped by subject and activity and the average for each feature was created. So, on each feature column the average per subject and actifity is displayed.


## Code book for the resulting dataset

"subject" Subject performing the activity, integer values: 1-30

"activity" Activity with values: WALKING / WALKING_UPSTAIRS / WALKING_DOWNSTAIRS / SITTING/ STANDING / LAYING

"tBodyAcc-mean-X" "tBodyAcc-mean-Y" "tBodyAcc-mean-Z" "tGravityAcc-mean-X" "tGravityAcc-mean-Y" "tGravityAcc-mean-Z" "tBodyAccJerk-mean-X" "tBodyAccJerk-mean-Y" "tBodyAccJerk-mean-Z" "tBodyGyro-mean-X" "tBodyGyro-mean-Y" "tBodyGyro-mean-Z" "tBodyGyroJerk-mean-X" "tBodyGyroJerk-mean-Y" "tBodyGyroJerk-mean-Z" "tBodyAccMag-mean" "tGravityAccMag-mean" "tBodyAccJerkMag-mean" "tBodyGyroMag-mean" "tBodyGyroJerkMag-mean" "fBodyAcc-mean-X" "fBodyAcc-mean-Y" "fBodyAcc-mean-Z" "fBodyAcc-meanFreq-X" "fBodyAcc-meanFreq-Y" "fBodyAcc-meanFreq-Z" "fBodyAccJerk-mean-X" "fBodyAccJerk-mean-Y" "fBodyAccJerk-mean-Z" "fBodyAccJerk-meanFreq-X" "fBodyAccJerk-meanFreq-Y" "fBodyAccJerk-meanFreq-Z" "fBodyGyro-mean-X" "fBodyGyro-mean-Y" "fBodyGyro-mean-Z" "fBodyGyro-meanFreq-X" "fBodyGyro-meanFreq-Y" "fBodyGyro-meanFreq-Z" "fBodyAccMag-mean" "fBodyAccMag-meanFreq" "fBodyBodyAccJerkMag-mean" "fBodyBodyAccJerkMag-meanFreq" "fBodyBodyGyroMag-mean" "fBodyBodyGyroMag-meanFreq" "fBodyBodyGyroJerkMag-mean" "fBodyBodyGyroJerkMag-meanFreq" "tBodyAcc-std-X" "tBodyAcc-std-Y" "tBodyAcc-std-Z" "tGravityAcc-std-X" "tGravityAcc-std-Y" "tGravityAcc-std-Z" "tBodyAccJerk-std-X" "tBodyAccJerk-std-Y" "tBodyAccJerk-std-Z" "tBodyGyro-std-X" "tBodyGyro-std-Y" "tBodyGyro-std-Z" "tBodyGyroJerk-std-X" "tBodyGyroJerk-std-Y" "tBodyGyroJerk-std-Z" "tBodyAccMag-std" "tGravityAccMag-std" "tBodyAccJerkMag-std" "tBodyGyroMag-std" "tBodyGyroJerkMag-std" "fBodyAcc-std-X" "fBodyAcc-std-Y" "fBodyAcc-std-Z" "fBodyAccJerk-std-X" "fBodyAccJerk-std-Y" "fBodyAccJerk-std-Z" "fBodyGyro-std-X" "fBodyGyro-std-Y" "fBodyGyro-std-Z" "fBodyAccMag-std" "fBodyBodyAccJerkMag-std" "fBodyBodyGyroMag-std" "fBodyBodyGyroJerkMag-std"

The average for each feature with values between -1 and 1.
