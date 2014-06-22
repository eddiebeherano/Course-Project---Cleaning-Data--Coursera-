Cleaning data method : 

1) When we read features.txt and activity_labels.txt files we remove the unecessary columns.
2) When we merge the test and the train files we name the variables by using features.txt file. We name the first column Subject.Number and the second one Activity.

3) In order to filter out only the columns that  describe a mean or a st. deviation , we filter all the columns that have "std" or "mean" in their names.
4) We then rename the activities 1,2,3,4,5,6 to
"WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING" resepctively.

5)We rename the columns so they become readble by humans. All the columns containing :

"BodyAcc" are replaced with "Body_Acceleration"
"GravityAcc" are replaced with "Gravity_Acceleration"
"BodyGyro" are replaced with "Body_Gyroscope"
"BodyGyroMag" are replaced with "Body_Gyro_Magnitude"
"JerkMag" are replaced with "Jerk_Magnitude"
"t_" are replaced with "Time_"
"f_" are replaced with "Frequency_"

6) Finally , we create a new tidy dataset containing the mean of the variables per subject per activity. 


With all the variables, the data has been divided by its range (gyroscope, entropy, etc) to normalise it. When we divide something with a set of units by something else using the same set of units, the units are cancelled out leaving us with a ratio
