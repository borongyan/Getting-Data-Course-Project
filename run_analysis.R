# Step 0: Load & read data
 ## set work directory
 setwd("C:/Users/meng/Desktop/Coursera/Getting-Data-Course-Project")

 ## Download data file
 file.url <-
        'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
 file.dest <- 'UCI HAR Dataset.zip'
 download.file(file.url, file.dest)

 ## Unzip data file
 unzip('UCI HAR Dataset.zip',exdir = ".")

 ## Read the label file
 activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
 
 ## Read the feature file
 features <- read.table("UCI HAR Dataset/features.txt")
 
 ## Read the training data
 train_X <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
 train_y <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
 train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
 
 ## Read the test data
 test_X <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
 test_y <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
 test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
 
# Step 1: Merges the training and the test sets to create one data set
 ## Merge the test data
 TotaTest <- cbind(test_subject,test_y, test_X)
 
 ## Merge the training data
 TotaTrain <- cbind(train_subject,train_y, train_X)
 
 ## Merge the training and the test sets to a new whole data set
 Tota <- rbind(TotaTest, TotaTrain)
 
 ## Uses descriptive activity names to name the activities in the data set
 ## Appropriately labels the data set with descriptive variable names.
 Tota[,2] <- activity_labels[match(Tota[,2], activity_labels[,1]),2]
 
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
 ## add feature names to total data set
 ChangeName <- c("Subject","Activity", as.vector(features[,2]))
 names(Tota) <- ChangeName
 NameColumnKeep <- c(ChangeName[1],ChangeName[2],
                     ChangeName[3],ChangeName[4],ChangeName[5],
                     ChangeName[6],ChangeName[7],ChangeName[8],
                     ChangeName[43],ChangeName[44],ChangeName[45],
                     ChangeName[46],ChangeName[47],ChangeName[48],
                     ChangeName[123],ChangeName[124],ChangeName[125],
                     ChangeName[126],ChangeName[127],ChangeName[128])
 Tota <- Tota[NameColumnKeep]
 
# Step 3:Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 TotaTidy <- ddply(Tota, .(Subject, Activity), numcolwise(mean))
 
# Step 4: print data
 write.table(TotaTidy, file = "TotaTidy.txt")
 
 
 
 
 
  