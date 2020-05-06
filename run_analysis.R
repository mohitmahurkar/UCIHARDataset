library(data.table)

#Initaial Step 1
act_lab <- read.table("E:/MOHIT/Coursera/UCI HAR Dataset/activity_labels.txt")
names(act_lab) <- c("Activity.Id","Activity")

#Initaial Step 1
feat_list <- read.table("E:/MOHIT/Coursera/UCI HAR Dataset/features.txt")

#1
test_sub <- read.table("E:/MOHIT/Coursera/UCI HAR Dataset/test/subject_test.txt")
names(test_sub) <- "Subject.Id"

#2
test_dat <- read.table("E:/MOHIT/Coursera/UCI HAR Dataset/test/X_test.txt")
names(test_dat) <- feat_list$V2

#3
test_act<-read.table("E:/MOHIT/Coursera/UCI HAR Dataset/test/Y_test.txt")
names(test_act)<-"Activity.Id"

#4
testset <- cbind(test_act,test_sub,test_dat)

#5
sliced_testset <- testset[,grepl("Subject.Id|Activity.Id|mean\\(\\)|std\\(\\)",colnames(testset))]

#6
final_testset <- merge(sliced_testset,act_lab,all=TRUE)

#7
train_sub <- read.table("E:/MOHIT/Coursera/UCI HAR Dataset/train/subject_train.txt")
names(train_sub) <- "Subject.Id"

#8
train_data <- read.table("E:/MOHIT/Coursera/UCI HAR Dataset/train/X_train.txt")
names(train_data) <- feat_list$V2

#9
train_act <- read.table("E:/MOHIT/Coursera/UCI HAR Dataset/train/Y_train.txt")
names(train_act) <- "Activity.Id"

#10
trainset <- cbind(train_sub,train_data,train_act)

#11
sliced_trainset <- trainset[,grepl("Subject.Id|Activity.Id|mean\\(\\)|std\\(\\)",colnames(trainset))]

#12
final_trainset <- merge(sliced_trainset,act_lab,all=TRUE)

#13
data <- merge(final_testset,final_trainset,all=TRUE)

#14
library(reshape2)

#15
average_columns <- colnames(data[,3:68])

#16
melted_data <- melt(data,id=c("Subject.Id","Activity"),measure.vars = average_columns)

#17
tidy_dataset <- dcast(melted_data, Subject.Id + Activity ~ variable, mean)

#18
write.table(tidy_dataset, file = "tidydataset.txt", row.names= FALSE)
