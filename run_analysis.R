## Install packages dplyr and data.table. Load libraries plyr and dplyr in that specific order for rbind.fill to work
library(plyr); library(dplyr)
library(data.table)

## Create dataframes for test and train populations from text files, as a preparation step for tidy data 
subject_train_df <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
subject_test_df <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
X_train_df <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
X_test_df <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
Y_test_df <- read.table("./UCI HAR Dataset/test/Y_test.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
Y_train_df <- read.table("./UCI HAR Dataset/train/Y_train.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
activity_labels_df <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)

## Prepare to attach signal variable names to merged dataset
## Create a data frame of signal variable list names and interpret signal domain classifications
signal_var_df <- read.table("./UCI HAR Dataset/features.txt", sep = " ", header = FALSE, stringsAsFactors = FALSE)
signal_var_df[grep("mean()", tolower(signal_var_df[,2]), fixed = TRUE), 3] <- "mean"
signal_var_df[grep("std()", tolower(signal_var_df[,2]), fixed = TRUE), 3] <- "std"

## Tidy Data Set - Preparation Step 1
## Combine Train and Test population/datasets into a single frame
merged_X_train_test_df <- rbind.fill(X_train_df, X_test_df)
merged_Y_train_test_df <- rbind.fill(Y_train_df, Y_test_df)
merged_subject_train_test_df <- rbind.fill(subject_train_df, subject_test_df)
merged_subject_Y_train_test_df <- cbind(merged_subject_train_test_df, merged_Y_train_test_df)
colnames(merged_subject_Y_train_test_df) <- c("SubjectId", "ActivityId")

## Tidy Data Set - Preparation Step 4
## Appropriately label the data set with descriptive variable names
colnames(merged_X_train_test_df) <- signal_var_df[, 2]

## Tidy Data Set - Preparation Step 2
## Extract only the measurements on the mean and standard deviation for each measurement
mean_std_df <- merged_X_train_test_df[,(signal_var_df[(signal_var_df$V3 %in% c("mean", "std")), 1])]

## Tidy Data Set - Preparation Step 3
## Use descriptive activity names to name the activities in the data set
merged_subject_Y_train_test_df$ActivityLabel <- activity_labels_df[merged_subject_Y_train_test_df$ActivityId, 2]
base_df <- cbind(merged_subject_Y_train_test_df[, c(1, 3)], mean_std_df)

## Tidy Data Set - Preparation Step 5
## Create an independent tidy data set with the average of each variable for each activity and each subject
tidy_dataset_df <- aggregate(base_df[, -1:-2], by = list(base_df$ActivityLabel, base_df$SubjectId), FUN = mean, na.rm = TRUE)
colnames(tidy_dataset_df)[1:2] <- c("ActivityLabel", "SubjectId")

## Create a text file with content of the tidy data set
write.table(tidy_dataset_df, file = "HAR Analysis tidy data.txt", sep = ",", row.names = FALSE, col.names = TRUE)
