Code Book

•	features <- features.txt : 561 obs, 2 variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.


•	Activity_labels <- activity_labels.txt : 6 obs, 2 variables

List of activities performed when the corresponding measurements were taken and its codes (labels)


•	sub_test <- test/subject_test.txt : 2947 obs, 1 variable

contains test data of 9/30 volunteer test subjects being observed


•	x_test <- test/X_test.txt : 2947 obs, 561 variables

contains recorded features test data


•	y_test <- test/y_test.txt : 2947 obs, 1 variable

contains test data of activities’code labels


•	sub_train <- test/subject_train.txt : 7352 obs, 1 variable

contains train data of 21/30 volunteer subjects being observed


•	x_train <- test/X_train.txt : 7352 obs, 561 variables

contains recorded features train data


•	y_train <- test/y_train.txt : 7352 obs, 1 variable

contains train data of activities’code labels


•	x_total is created by merging x_train and x_test using rbind() function

•	y_total is created by merging y_train and y_test using rbind() function

•	sub_total is created by merging sub_train and sub_test using rbind() function

•	total is created by merging sub_total, y_total and x_total using cbind() function

•	total_mean is created by subsetting total, selecting the measurements on the mean and standard deviation (std) for each measurement

