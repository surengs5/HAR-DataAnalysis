HAR-DataAnalysis
================

Purpose of the repository is to provide R code to prepare a tidy data set for further analysis using the source data from Human Activity Recognition Using Smartphones Data Sets provided by UCI Machine Learning Repository

The "run_analysis.R" script available in this repository creates a tidy data set and writes it as a text file in the working directory, implementing the high level logical steps listed below:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each
variable for each activity and each subject.

Execution Instructions/Steps:
Download the source zip file into the working directory from the following URL:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Extract the files including sub-directories as is, from zip file into the working directory
	This step should create a sub-directory structure and files as follows:
	./UCI HAR Dataset
		./UCI HAR Dataset/test
			./UCI HAR Dataset/test/Inertial Signals		**
			subject_test.txt	(9 unique subject identifiers performing activity in the test population) 
			X_test.txt		(2947observations for 561 variables)
			y_test.txt		(2947 activities performed by subjects - corresponding to observations in X_test)
		./UCI HAR Dataset/train
			./UCI HAR Dataset/train/Inertial Signals	**
			subject_train.txt	(21 unique subject identifiers performing activity in the train population - out of a total 30 volunteers) 
			X_train.txt		(7352 observations for 561 variables)
			y_train.txt		(7352 activities performed by subjects - corresponding to observations in X_train)
		activity_labels.txt		(Master data: Labels of activities performed by subjects - total of 6 activities)
		features.txt			(Master data: Labels of features vector estimated signal variables - total of 561 variables)
		features_info.txt		(Details of Signal variables derived from feature vector)
		README.txt			(Details of how to interpret the data sets across multiple files)

**Ignore for this project scope as the tidy data set is limited to only mean and standard deviation signal variables

The R script: run_analysis.R shall be placed in the working directory where the source zip file has been extracted

Set the working directory (using setwd command) in R and execute "run_analysis.R" script.
NOTE: The script does not have directory/file existence validation checks as the sub-directory structure including file content is expected as a result of zip file extract activity.

Couple of options to best view the content of tidy data set "HAR Analysis tidy data.txt" file is as follows:
    1. Download the tidy file "HAR Analysis tidy data.txt" into the working directory of R and execute the following commands
        data <- read.table("./HAR Analysis tidy data.txt", sep = ",", header = TRUE)
        View(data)
    2. Other option is to download the tidy data set file and open in MS Excel tool and selecting the comma as delimiter to convert Text to Columns


Reference:
The raw data analysis steps to prepare a tidy data set have been discussed in the following thread which is a good reference point for interpretation aspects.
https://class.coursera.org/getdata-008/forum/thread?thread_id=24

Details regarding the source data sets
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Read CodeBook.md for the approach taken to combine the data sets into a tidy data set for further exploratory data analysis purpose.
