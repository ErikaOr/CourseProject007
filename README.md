## 1. Merge the training and the test sets to create one data set.
## Thanks to the nice diagram postet in the forum
## I had an idea how to put the data pieces together

## read Train data and give it a name
# train_1 <- cbind subject_train and y_train
column names of train_1 <- "Subject" and "Activity"
# train <- cbind train_1 and x_train

## Test data
read Test data and give it a name
# test_1 <- cbind subject_test and y_test
column names of test_1 <- "Subject" and "Activity"
#test <- cbind test_1 and x_test

## mdata <- rbind Train and Test


## 2. Extract only the measurements on the mean and standard deviation for each measurement.
# select: mean and std
features <- read.table("./UCI HAR Dataset/features.txt")
## keep only mean() and std()
## I looked up the names in the features.txt and used this information
## to select columns in the main data file
new file: sdata <- mdata[keep]

## 3. Use descriptive activity names to name the activities in the data set
## Activity
read activity and give it a name
give the values in sdata in the column "Activity" the names: "WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING","STANDING", "LAYING"

## 4. Appropriately label the data set with descriptive variable names. 
## Features --> I didn't know how to do this automatically
##              (didn't have time to find out)
## I changed the names too cause in one of the lectures it says that the data
## shouldn't have specific signs
read features and give it a name
apply colnames (3 to 68) of sdata "tbodyaccmeanX", "tbodyaccmeany", "tbodyaccmeanz",
"tbodyaccstdx", "tbodyaccstdy","tbodyaccstdz", "tgravityaccmeanx",
"tgravityaccmeany", "tgravityaccmeanz", "tgravityaccstdx", "tgravityaccstdy",
"tgravityaccstdz","tbodyaccjerkmeanx", "tbodyaccjerkmeany", "tbodyaccjerkmeanz",
"tbodyaccjerkstdx", "tbodyaccjerkstdy", "tbodyaccjerkstdz", "tbodygyromeanx",
"tbodygyromeany", "tbodygyromeanz", "tbodygyrostdx", "tbodygyrostdy",
"tbodygyrostdz", "tbodygyrojerkmeanx", "tbodygyrojerkmeany", "tbodygyrojerkmeanz",
"tbodygyrojerkstdx", "tbodygyrojerkstdy", "tbodygyrojerkstdz", "tbodyaccmagmean",
"tbodyaccmagstd", "tgravityaccmagmean", "tgravityaccmagstd", "tbodyaccjerkmagmean",
"tbodyaccjerkmagstd", "tbodygyromagmean", "tbodygyromagstd", "tbodygyrojerkmagmean",
"tbodygyrojerkmagstd", "fbodyaccmeanx", "fbodyaccmeany", "fbodyaccmeanz",
"fbodyaccstdx", "fbodyaccstdy", "fbodyaccstdz", "fbodyaccjerkmeanx",
"fbodyaccjerkmeany", "fbodyaccjerkmeanz", "fbodyaccjerkstdx", "fbodyaccjerkstdy",
"fbodyaccjerkstdz", "fbodygyromeanx", "fbodygyromeany", "fbodygyromeanz",
"fbodygyrostdx", "fbodygyrostdy", "fbodygyrostdz", "fbodyaccmagmean",
"fbodyaccmagstd", "fbodyaccjerkmagmean", "fbodyaccjerkmagstd", "fbodygyromagmean",
"fbodygyromagstd", "fbodygyrojerkmagmean", "fbodygyrojerkmagstd"

## 5. From the data set in step 4, create a second, independent tidy data set
## with the average of each variable for each activity and each subject.
## Order by Subject --> doesn't work..
## Warnings, but I don't know what I did wrong..
calculate mean by subject and activity with aggregate function
## drop Activity and Subject and rename Group.2 and Group.1
first and second columns: names "Subject" and "Activity"
arrange the data, but ut doesn't work
## I wanted Subject ordered like this(1,1,1,...,2,2,2,...)

## create txt
