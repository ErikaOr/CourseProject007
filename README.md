CourseProject007
================
## 1. Merge the training and the test sets to create one data set.
## Thanks to the nice diagram postet in the forum
## I had an idea how to put the data pieces together

## Train data

# cbind

# cbind


## Test data

# cbind



## rbind Train and Test



## 2. Extract only the measurements on the mean and standard deviation for each measurement.
# select: mean and std
features <- read.table("./UCI HAR Dataset/features.txt")
## keep only mean() and std()
## I looked up the names in the features.txt and used this information
## to select columns in the main data file


## 3. Use descriptive activity names to name the activities in the data set
## Activity


## 4. Appropriately label the data set with descriptive variable names. 
## Features --> I didn't know how to do this automatically
##              (didn't have time to find out)
## I changed the names too cause in one of the lectures it says that the data
## shouldn't have specific signs


## 5. From the data set in step 4, create a second, independent tidy data set
## with the average of each variable for each activity and each subject.
## Order by Subject --> doesn't work..

## Warnings, but I don't know what I did wrong..

## drop Activity and Subject and rename Group.2 and Group.1

## I wanted Subject ordered like this(1,1,1,...,2,2,2,...)

## create txt

