##CodeBook.md
### How does the code works
# 1) merges the files containg the measurments (X-files) with the Subject
# file (describing individuals) and y file (describing activities). This is
# done separately for the train and test set. The result is stored in the table
# TotaTrain and TotaTest, respectively.
#
# 2) merges the TotaTrain and TotaTest tables (row wise), into table Tota
#
# 3) inserts descriptive activity names to the data set (by  
# mapping the numbers to actual activities using the "activity_labels" file)
#
# 4) inserts descriptive variable names ("column naming") based on the 
# "features" file (and remembering that the subject column describes subjects
# and y-test column describes activities)
#
# 5) subtracts only the original measurements on the mean and SD. All columns 
# from the X files that are not original measurements are removed as well, 
# even though they might indicate a mean or SD on a processed result
# (e.g. all frequency domain variables are removed)
#
# 6) Creates a second tidy data set (named TotaTidy) with the average of each
# variable of each activity and each subject.

### Variables and Data
activity_labels :  this variable is used to store the data in "activity_labels.txt"
features : this variable is used to store the data in "features.txt"
train_X, train_y and train_subject are used to form a new training data set called TotaTest
test_X, test_y and test_subject are used to form a new test data set called TotaTrain
Tota : this variable is used to store the whole new data set by combining TotaTest and TotaTrain
NameColumnKeep is used to store the columns data that should be left.
TotaTidy is used to keep the final clean data.

### Packages
This repo requires to install the "plyr" package, and use the ddply function to finish the whole project


