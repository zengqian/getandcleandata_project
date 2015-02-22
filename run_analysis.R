#############################
###For getting and cleaning data project, to create a tidy data set of Human Activity Recognition Using Smartphones Data Set

# Clear the workspace
rm(list=ls())

# Load the activity labels

activity_labels <- read.table("activity_labels.txt", header=FALSE, sep="", colClasses=c("numeric", "character"), 
                              col.names=c("activity_id", "activity"))

# Lower the case of activity description and removing "_"
activity_labels$activity <- sub("_", " ", tolower(activity_labels$activity))

# Load the features list
features <- read.table("features.txt", header=FALSE, sep="", colClasses=c("numeric", "character"), 
                       col.names=c("feature_id", "feature"))

# Remove "()" characters from the variable names
features$feature <- gsub("[()]", "", tolower(features$feature))

# Replace "-" characters by "_" in the variable names
features$feature <- gsub("-", "_", features$feature)

# Load the training data
subject_train <- read.table("train/subject_train.txt", header=FALSE, sep="", colClasses="numeric", col.names="subject_id")
y_train <- read.table("train/y_train.txt", header=FALSE, sep="", colClasses="numeric", col.names="activity_id")
X_train <- read.table("train/X_train.txt", header=FALSE, sep="", colClasses="numeric")

# Use descriptive names for the activities in the data set
names(X_train) <- features$feature

# Column bind the training data
train <- cbind(subject_train, activity_id=y_train$activity_id, X_train)

# Labels properly the activities
train <- merge(activity_labels, train, by="activity_id")

# Clear memory
rm(subject_train, y_train, X_train)

# Load the test data
subject_test <- read.table("test/subject_test.txt", header=FALSE, sep="", colClasses="numeric", col.names="subject_id")
y_test <- read.table("test/y_test.txt", header=FALSE, sep="", colClasses="numeric", col.names="activity_id")
X_test <- read.table("test/X_test.txt", header=FALSE, sep="", colClasses="numeric")

# Use descriptive lower case names to name the activities in the data set
names(X_test) <- features$feature

# Column bind the test data
test <- cbind(subject_test, activity_id=y_test$activity_id, X_test)

# Labels properly the activities
test <- merge(activity_labels, test, by="activity_id")

# Row bind the training and test sets to create one data set
data <- rbind(train, test)

# Clear memory
rm(X_test, activity_labels, features, subject_test, test, train, y_test)

# Find the mean() and std() attributes with regular expression
mean_std_attributes <- grep("_mean_[xyz]|_mean$|_std_[xyz]|_std$", names(data), value=TRUE)

# Select only the mean() and std() attributes
data <- data[, c("subject_id", "activity", mean_std_attributes)]

# Clear memory
rm(mean_std_attributes)

# Create a second tidy data set with the average of each variable for each
# activity and each subject
tidydata <- aggregate(data[, 3:ncol(data)], by=list(data$subject_id, data$activity), mean)

# Rename the first two attributes
names(tidydata)[1:2] <- c("subject_id", "activity")

# Output the tidy dataset to a text file
write.table(tidydata, file="tidydata.txt", sep=";", row.names=FALSE)