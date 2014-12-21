getwd()
setwd("C:/Users/Sergey/Documents/R/Coursera/Course 3")
## doswnload arhive
url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="./Course_project_3.zip")
##prepare test, train files and variable names
unzip_varnames<-unzip("./Course_project_3.zip", files="UCI HAR Dataset/features.txt")

unzip_test1<-unzip("./Course_project_3.zip", files="UCI HAR Dataset/test/X_test.txt")
unzip_test2<-unzip("./Course_project_3.zip", files="UCI HAR Dataset/test/y_test.txt")
unzip_test3<-unzip("./Course_project_3.zip", files="UCI HAR Dataset/test/subject_test.txt")
test_dt = c (unzip_test1,unzip_test2,unzip_test3)

unzip_train1<-unzip("./Course_project_3.zip", files="UCI HAR Dataset/train/X_train.txt")
unzip_train2<-unzip("./Course_project_3.zip", files="UCI HAR Dataset/train/y_train.txt")
unzip_train3<-unzip("./Course_project_3.zip", files="UCI HAR Dataset/train/subject_train.txt")
train_dt = c (unzip_train1,unzip_train2,unzip_train3)
## Merging data (step 1 & step 4 !!!)
test_data <- cbind(read.table(unzip_test1),read.table(unzip_test2),read.table(unzip_test3))
colnames(test_data) <- append(as.character(read.table(unzip_varnames)[,2]), values =c("activity_numb", "subj_numb"))

train_data <- cbind(read.table(unzip_train1),read.table(unzip_train2),read.table(unzip_train3))
colnames(train_data) <- append(as.character(read.table(unzip_varnames)[,2]), values =c("activity_numb", "subj_numb"))

full_data <- rbind(test_data, train_data)
## drop useless variables (step 2). Looking for: "Mean", "mean" and "std". (I haven't seen "Std")
varnames<-read.table(unzip_varnames)
as.character(varnames[561,2])
vars_to_use <- grepl("Mean",as.character(varnames[,2])) | grepl("mean",as.character(varnames[,2])) | grepl("std",as.character(varnames[,2]))

full_data_cleaned<-full_data[,vars_to_use]
## Name activities (step 3)
unzip_act_labels<-unzip("./Course_project_3.zip", files="UCI HAR Dataset/activity_labels.txt")
activity_names<-read.table(unzip_act_labels)
colnames(activity_names)<- c("activity_numb", "activity_name")

head(merge(full_data_cleaned,activity_names, by.x = "activity_numb", by.y = "V2"))
full_data_named_activ <- join(full_data_cleaned,activity_names, by="activity_numb" , type = "left")
## drop activity_numb column
full_data_named_activ <-full_data_named_activ[,-87]
tail(full_data_named_activ)
## Name variables (step 4)

# install "plyr" if needed
# install.packages("plyr")
library(plyr)

## create summary table (calc mean for each var for a given set activity - subject)
summary_table<-(ddply(full_data_named_activ, .(subj_numb,activity_name), numcolwise(mean)))

write.table (summary_table, file = "course_project_3_completed", row.name=FALSE)
