library(dplyr)

setwd("./data/UCI HAR Dataset")

# train data 
x_train   <- read.table("./train/X_train.txt")
y_train   <- read.table("./train/Y_train.txt") 
sub_train <- read.table("./train/subject_train.txt")

# test data 
x_test   <- read.table("./test/X_test.txt")
y_test   <- read.table("./test/Y_test.txt") 	
sub_test <- read.table("./test/subject_test.txt")

# read features description 
features <- read.table("./features.txt") 

# read activity labels 
activity_labels <- read.table("./activity_labels.txt") 


# 1) Merging the training and the test sets to create one data set.

x_total   <- rbind(x_train, x_test)
y_total   <- rbind(y_train, y_test) 
sub_total <- rbind(sub_train, sub_test) 

# 2) Extracting only the measurements on the mean and standard deviation for each measurement

sel_features <- variable_names[grep(".*mean\\(\\)|std\\(\\)", features[,2], ignore.case = FALSE),]
x_total      <- x_total[,sel_features[,1]]

# 4) labeling the data set with descriptive variable names. 

colnames(x_total)   <- sel_features[,2]
colnames(y_total)   <- "activity"
colnames(sub_total) <- "subject"

# merging final dataset
 
total <- cbind(sub_total, y_total, x_total)

# 3) Descriptive activity names for activities in the data set

total$activity <- factor(total$activity, levels = activity_labels[,1], labels = activity_labels[,2])
total$subject  <- as.factor(total$subject) 

# 5) From the data set in step 4, creating a second, independent tidy data set with the average
# of each variable for each activity and each subject

total_mean <- total %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 

# exporting summary dataset
write.table(total_mean, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE) 

