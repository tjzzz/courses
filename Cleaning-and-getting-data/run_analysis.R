## Getting and cleaning data__Project 1


####
##### read data
setwd("F:/05Course/Data science/3.Geting and cleaning data/Hw/p1/UCI HAR Dataset")
activity_label<-read.table("activity_labels.txt")
features<-read.table("features.txt")



########## For the test data
subject_test<-read.table("./test/subject_test.txt")
X_test<-read.table("./test/X_test.txt")
y_test<-read.table("./test/y_test.txt")

# step1: relate y_label and activity_label
activity_test=factor(as.numeric(y_test[,1]),
          labels=activity_label[,2])
# step2: cbind() the data
test<-cbind(subject_test,activity_test,X_test)
varnames<-c("subject","activity",as.character(features[,2]))
varnames<-gsub("\\()","",varnames)


colnames(test)=varnames



########## For the train data
subject_train<-read.table("./train/subject_train.txt")
X_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/y_train.txt")

# step1: relate y_label and activity_label
activity_train=factor(as.numeric(y_train[,1]),
                     labels=activity_label[,2])
# step2: cbind() the data
train<-cbind(subject_train,activity_train,X_train)
colnames(train)=varnames

# rbind the train and test data
dat<-rbind(train,test)



#### 
# find the measurement with mena and std
# Extracts only the measurements on the mean and standard deviation
index1<-grep("mean",varnames)
index2<-grep("std",varnames)
subdata=dat[,c(1,2,index1,index2)]



### tidy data
num=ncol(subdata)
attach(subdata)
tidydata=aggregate(subdata[,3:num],by=list(subject,activity),mean)

##output
colnames(tidydata)[1:2]=c("subject","activity")
write.table(tidydata,file="tidydata.txt",row.names=F)
























