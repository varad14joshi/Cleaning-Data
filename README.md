# Cleaning-Data


## This repository was created because of an assignment for Getting and Cleaning Data on Coursera

**The repository contains the following 4 files

1) README.md - It is the markdown document which is used to explain the step by step process for the project
2) run_analysis.R  - It is the R script file which contains the code used to create a tidy data set
3)  tidydata.txt   -  It is the text file which is the output produced by performing the run_analysis.R to get a tidy data set
4) CodeBook.md - A markdown file which contains the variables of the dataset.

---

## Step by Step Process


**Step 1: Download the zip file from the url given below and unzip it the directory of use

      URL:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
      
      
 **Step 2: Read the X_train.txt and X_test.txt file from the unzipped directory
 
 **Step 3: Merge both the data frames.
 
 **Step 4: Read the features.txt file and assign the features to the columns of the merged data frame.
 
 **Step 5: Select the columns with mean and standard deviation(std) in their name and form a new data set.
 
 **Step 6: Read the Y_train.txt and Y_test.txt file and merge them to form one data frame for activity
 
 **Step 7: Read the activity_labels.txt file and add a column to the activity datset with activity name corresponding to respective id as specided in the activity_labels.txt file/
 
 **Step 8: Read the sub_train.txt file and sub_test.txt file and merge them.
 
 **Step 9: Merge the features file with subject and activity file.
 
 **Step 10: Group the data with respect to activity and subject_id  and find the mean with the help of the summarize_each function.
 
 **Step 11:  Create a new file tidydata.txt with the output of step 10 in it.
