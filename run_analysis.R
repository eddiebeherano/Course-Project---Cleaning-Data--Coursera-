library(jpeg)
library(plyr)
library(Hmisc)

## Setting working directory :

setwd("C:/Users/Eddie-Main/Desktop/R data folder/CleaningData/UCI HAR Dataset")

##Reading in the features.txt and activity_labels file:

features <- read.table("features.txt",stringsAsFactors=FALSE, sep="")

labels <- read.table("activity_labels.txt",stringsAsFactors=FALSE, sep="")

#Cleaning features.txt and activity_labels.txt (removing unnessesary column)
features <- features$V2
labels <- labels$V2

#Readng test data:

X_test = read.table("./test/X_test.txt", sep="")
Y_test = read.table("./test/y_test.txt", sep="")
subject_test = read.table("./test/subject_test.txt", sep="")

#Reading train data:
X_train = read.table("./train/X_train.txt", sep="")
Y_train = read.table("./train/y_train.txt", sep="")
subject_train = read.table("./train/subject_train.txt", sep="")

# labelling the data .
names(X_test) <- features
names(X_train) <- features

colnames(Y_test) <- c("Activity")
colnames(Y_train) <- c("Activity")

colnames(subject_test) <- c("Subject.Number")
colnames(subject_train) <- c("Subject.Number")

# Part 1 :  Merges the training and the test sets to create one data set.
bind1<- cbind(subject_test,Y_test)
testdata <- cbind(bind1, X_test)

bind2<- cbind(subject_train,Y_train)
traindata <- cbind(bind2, X_train)

alldata <- rbind(testdata,traindata)

#Part 2 : Mean and st.dev for each variable, we use the grepl function to find all the column names
#which contain "mean" or "std" in the strings.

meanstd<-alldata[,c(1,2,grepl("mean",names(alldata))==TRUE | grepl("std",names(alldata))==TRUE)]

meanstd<-alldata[,grepl("mean",names(alldata))==TRUE | grepl("std",names(alldata))==TRUE]

meanstd<- cbind(alldata[,1:2],meanstd)

#Part 3 : Using descriptive activity names to name the activities in the data set

alldata$Activity <-gsub("1", "WALKING", alldata$Activity)
alldata$Activity <-gsub("2", "WALKING_UPSTAIRS", alldata$Activity)
alldata$Activity <-gsub("3", "WALKING_DOWNSTAIRS", alldata$Activity)
alldata$Activity <-gsub("4", "SITTING", alldata$Activity)
alldata$Activity <-gsub("5", "STANDING", alldata$Activity)
alldata$Activity <-gsub("6", "LAYING", alldata$Activity)


#Part 4: Appropriately labels the data set with descriptive variable names.

names(alldata) <- gsub("BodyAcc", "_Body_Acceleration_", names(alldata))
names(alldata) <- gsub("GravityAcc", "_Gravity_Acceleration_", names(alldata))
names(alldata) <- gsub("BodyGyro", "_Body_Gyroscope_", names(alldata))
names(alldata) <- gsub("BodyGyroMag", "_Body_Gyroscope_Magnitude_", names(alldata))
names(alldata) <- gsub("JerkMag", "_Jerk_Magnitude_", names(alldata))
names(alldata) <- gsub("t_", "Time_", names(alldata))
names(alldata) <- gsub("f_", "Frequency_", names(alldata))
names(alldata) <- gsub("fBody", "Frequency_", names(alldata))

#Part 5 : Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

tidydata <-ddply(meanstd,.(Subject.Number,Activity),numcolwise(mean))

#Writing tidy dataset to tidydata.txt
write.table (tidydata, file = "tidydata.txt", sep = " ") 
