Course-Project---Cleaning-Data--Coursera-
=========================================

run_analysis.R reads in to R and merges the .txt files (X_test, y_test, subject_test, X train , Y_train, subject_train).
It labels the data with the features.txt and performs all the necessary cleaning to the data set.


It renames the activities 1,2,3,4,5,6 as "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING" resepctively.

 then renames all the columns in the following way :

All the columns containing : 
- "BodyAcc" are replaced with "_Body_Acceleration_"
- "GravityAcc" are replaced with "_Gravity_Acceleration_"                            
- "BodyGyro" are replaced with "_Body_Gyroscope_"      
- "BodyGyroMag" are replaced with "_Body_Gyro_Magnitude_"
- "JerkMag" are replaced with "_Jerk_Magnitude_"      
- "t_" are replaced with "Time_"      
- "f_" are replaced with "Frequency_"

Finally , it creates a new tidy dataset file using the write.table function.




Course Project : Cleaning Data (Coursera)
