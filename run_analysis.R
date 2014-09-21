## 1. Merge the training and the test sets to create one data set.
## Thanks to the nice diagram postet in the forum
## I had an idea how to put the data pieces together

## Train data
x_train <- read.table("./train/X_train.txt")
subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")
# cbind
train_1 <- cbind(subject_train, y_train)
names(train_1)[1] <- "Subject"
names(train_1)[2] <- "Activity"
# cbind
train <- cbind(train_1, x_train)

## Test data
x_test <- read.table("./test/x_test.txt")
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")
# cbind
test_1 <- cbind(subject_test, y_test)
names(test_1)[1] <- "Subject"
names(test_1)[2] <- "Activity"
# cbind
test <- cbind(test_1, x_test)

## rbind Train and Test
mdata <- rbind(train, test)


## 2. Extract only the measurements on the mean and standard deviation for each measurement.
# select: mean and std
features <- read.table("./UCI HAR Dataset/features.txt")
## keep only mean() and std()
## I looked up the names in the features.txt and used this information
## to select columns in the main data file
keep <- c("Subject","Activity", "V1", "V2", "V3", "V4", "V5", "V6", "V41", "V42",
          "V43", "V44", "V45", "V46", "V81", "V82", "V83", "V84", "V85", "V86",
          "V121", "V122", "V123", "V124", "V125", "V126", "V161", "V162", "V163",
          "V164", "V165", "V166", "V201", "V202", "V214", "V215", "V227", "V228",
          "V240", "V241", "V253", "V254", "V266", "V267", "V268", "V269", "V270",
          "V271", "V345", "V346", "V347", "V348", "V349", "V350", "V424", "V425",
          "V426", "V427", "V428", "V429", "V503", "V504", "V516", "V517", "V529",
          "V530", "V542", "V543")
head(mdata[keep])
sdata <- mdata[keep]

## 3. Use descriptive activity names to name the activities in the data set
## Activity
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity
sdata$Activity <- factor(sdata$Activity,
                         levels = c(1,2,3,4,5,6),
                         labels = c("WALKING", "WALKING_UPSTAIRS",
                                    "WALKING_DOWNSTAIRS", "SITTING",
                                    "STANDING", "LAYING"))

## 4. Appropriately label the data set with descriptive variable names. 
## Features --> I didn't know how to do this automatically
##              (didn't have time to find out)
## I changed the names too cause in one of the lectures it says that the data
## shouldn't have specific signs
features <- read.table("./UCI HAR Dataset/features.txt")
colnames(sdata)[3:68] <- c("tbodyaccmeanX", "tbodyaccmeany", "tbodyaccmeanz",
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
"fbodygyromagstd", "fbodygyrojerkmagmean", "fbodygyrojerkmagstd")

## 5. From the data set in step 4, create a second, independent tidy data set
## with the average of each variable for each activity and each subject.
## Order by Subject --> doesn't work..
library(plyr)
arrange(sdata,Subject)
## Warnings, but I don't know what I did wrong..
tdata <- aggregate(sdata,by=list(sdata$Subject, sdata$Activity), FUN=mean)
## drop Activity and Subject and rename Group.2 and Group.1
tdata$Subject <- NULL
tdata$Activity <- NULL
colnames(tdata)[1:2] <- c("Subject", "Activity")
arrange(tdata,Subject) ##doesn't work??
## I wanted Subject ordered like this(1,1,1,...,2,2,2,...)

## create txt
tinydata <- write.table(tdata, "tinydata.txt", row.name=FALSE)
