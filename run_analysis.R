library(stringr)
##Prepare data:  download and extract raw dataset
if(!file.exists("projectdata.zip")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "projectdata.zip", method = "curl")
  unzip("projectdata.zip")
}

# Read data
testSubjectFile <- "UCI HAR Dataset/test/subject_test.txt"
testActivityFile <- "UCI HAR Dataset/test/y_test.txt"
testMeasurements <- "UCI HAR Dataset/test/x_test.txt"

trainSubjectFile <- "UCI HAR Dataset/train/subject_train.txt"
trainActivityFile <- "UCI HAR Dataset/train/y_train.txt"
trainMeasurements <- "UCI HAR Dataset/train/x_train.txt"


testSubjectDF <- read.table(testSubjectFile)
testActivityDF <- read.table(testActivityFile)
testMeasurementsDF <- read.table(testMeasurements)
#print("test")
#print(dim(testSubjectDF))
#print(dim(testActivityDF))
#print(dim(testMeasurementsDF))

trainSubjectDF <- read.table(trainSubjectFile)
trainActivityDF <- read.table(trainActivityFile)
trainMeasurementsDF <- read.table(trainMeasurements)
#print("train")
#print(dim(trainSubjectDF))
#print(dim(trainActivityDF))
#print(dim(trainMeasurementsDF))

# Merge datasets
subjectDF <- rbind(testSubjectDF, trainSubjectDF)
activityDF <- rbind(testActivityDF, trainActivityDF)
measurementsDF <- rbind(testMeasurementsDF, trainMeasurementsDF)
#print("merged size")
#print(dim(subjectDF))
#print(dim(activityDF))
#print(dim(measurementsDF))

#Load feature names
featureNamesFile <- "UCI HAR Dataset/features.txt"
featureNames <- read.table(featureNamesFile)
featureNames <-featureNames[,2] #extract only the text
featureNames <- str_replace(featureNames, "\\(\\)","") #clean the names by removing paranthesis from features
featureNames <- str_replace(featureNames, ",",".")
names(measurementsDF) <- featureNames

names(subjectDF) <- "subject"
names(activityDF) <- "activity"
#print(dim(featureNames))
humanActivityDataSet <- cbind(subjectDF, activityDF, measurementsDF)
#print("single merged dataset size")



print(names(humanActivityDataSet))
#fBodyAcc-bandsEnergy-** duplicate column names
#remove duplicated columns
humanActivityDataSet <- humanActivityDataSet[, !duplicated(colnames(humanActivityDataSet))]

#Extract only the measurements on the mean and standard deviation for each measurement. 
#extract subject and aclivity columns and columns which contains mean and std
#remove columns which contains "angle"
meanAndStdDev <- select(humanActivityDataSet, subject, activity, contains("mean"), contains("std")) 
meanAndStdDev <- select(meanAndStdDev, -contains("angle"))
#print("meanAndStdDev dataset size")
print(dim(meanAndStdDev))
print(summary(meanAndStdDev))

#load activity labels
activityNamesFile <- "UCI HAR Dataset/activity_labels.txt"
activityNames <- read.table(activityNamesFile)
#create an activity names vector in order to easily access data by index
activityNames <- activityNames[,2]

#Use descriptive activity names to name the activities in the data set

meanAndStdDev <- mutate(meanAndStdDev, activity = activityNames[meanAndStdDev$activity])
#print(head(meanAndStdDev))

#create a tidy data set with the average of each variable for each activity and each subject.
averageDS <- meanAndStdDev %>% group_by(subject, activity) %>% summarise_each(funs(mean))

print(head(averageDS))
#write result in result.txt file
write.table(averageDS, file = "result.txt", row.names = FALSE)
