
Code Book for HAR data analysis and tidy data preparation
---------------------------------------------------------
Data sets are available as train and test populations and reference labels are available for activities and feature signals in separate source files. Refer to README.md for source file details.
Training Data Sets:
X_train.txt		561 signal variable values covered across 7352 observations
Y_train.txt		7352 activity codes corresponding to X_train observations data set
subject_train.txt	7352 occurrences of corresponding subject ids to activities

Test Data Sets:
X_test.txt		561 signal variable values covered across 2947 observations
Y_test.txt		2947 activity codes corresponding to X_train observations data set
subject_test.txt	2947 occurrences of corresponding subject ids to activities

Data Analysis and Tidy Data Set Creation Approach:
--------------------------------------------------
Append the Test data set to the Training data set to create one population of all signal variables
	Design factors to append the Test data set to the Training data set:
		The ordinal positions of 561 signal variables is exactly in the same order (left to right) in Train and Test data set files.

Analyze and prepare a tidy data set with means of relevant signal variables within a Subject and Activity
	Each signal variable observation correspond to a specific Subject and Activity combination
	Each subject exclusively belongs to either Test data set or train data set, with no overlap 
	Setup one data set combining Train and Test Subject and Activities
	Setup one data set combining Train and Test Signal variables data sets
	Create a finer breadth data set, exclusively with mean or standard deviation signal variables
	Combine Subject-Activity dataset with finer breadth singal variables data set, based on ordinal position of observations
	Ensure no sorting occurs in above steps to retain the ordinal position intact for bind/merge steps to match among observations/subject/activity
	Calculate mean of finer breadth data set variables, with in each Subject and Activity having observations

Prepare a text file with the tidy data set

The tidy data set should have the following associated activity labels in place of activity ids.
Activity Id	Activity Label
1		WALKING
2		WALKING_UPSTAIRS
3		WALKING_DOWNSTAIRS
4		SITTING
5		STANDING
6		LAYING

The final set of feature signal quantitative variables (66 in total apart from Subject and Activity related variables) for which mean should be calculated in tidy data set are as follows:
 [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"          
 [4] "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 [7] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"       
[10] "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"      
[16] "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[19] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"         
[22] "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"     
[28] "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"      
[34] "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"    
[40] "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"           
[46] "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"       
[52] "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[55] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"          
[58] "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"    
[64] "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"

The tidy data set should include a total of 68 variables:
2 aggregating qualitative variables: ActivityLabel and SubjectId
66 quantitative variables with the calculated mean of signal variables listed above

The expected population of tidy data set shall be 180 observations as each Subject (30 overall volunteers) performs all six activities from which signal variables are dtermined.
The left to right order of variables shall be:
Activity Label, SubjectId followed by the 66 signal variables they existed left to right in the X_test.txt & X_train.txt files

The precedence of ActivityLabel to SubjectId in aggregation of tidy data set was based on the following requirement listed in step 5:
 Create an independent tidy data set with the average of each variable for each activity and each subject

The population would be conducive to further data analysis by keeping all the variables related to a subject and activity pair as one observation rather than preparing a separate observation line
 per each variable. The latter option would make a much longer dataset without giving real benefit in further exploratory data analysis steps to easily compare/correlate variables for a subject & activity pair,
 as they would need to be coalesced from multiple observations if they are not kept in a wider tidy data set.
