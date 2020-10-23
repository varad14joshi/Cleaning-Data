library(dplyr)


#Read the training and testing data
train<-read.table("./train/X_train.txt")
test<-read.table("./test/X_test.txt")

#Read the features file and store the feature name in a character vector
feature<-read.table("features.txt")
coln<-feature[,2]


#Remove the brackets and hyphen from the feature names
coln<-gsub("-","",coln)
coln<-gsub("\\()","",coln)


#Assign the feature names as column names
names(train)<-coln
names(test)<-coln


#Merge the training and testing data
mergedd<-rbind(train,test)


#Change all the column names to lowercase  so that it is easy to use
names(mergedd)<-tolower(names(mergedd))


#Finding all the columns names containing mean and std and assigning a data frame to it
mindex<-grep("mean",names(mergedd))
stdindex<-grep("std",names(mergedd))

l<-names(mergedd[,mindex])
l2<-names(mergedd[,stdindex])

mergemean<-mergedd[,l]
mergestd<-mergedd[,l2]


#Merge the data frame with column names containing mean and std
mergefinal<-cbind(mergemean,mergestd)



#Read activity test and train data and merging it
atrain<-read.table("./train/Y_train.txt")
atest<-read.table("./test/Y_test.txt")
activity<-rbind(atrainnro,atest)

#Read activity labels
activitynames<-read.table('activity_labels.txt')

#Adding a column to the merged data set containing the activity name with respect to its id
names(activity)[1]<-"activity_id"
activity<-mutate(activity,activityname=activitynames[activity[,1],2])


#Read the subject test and train data set and merging it
strain<-read.table("./train/subject_train.txt")
stest<-read.table("./test/subject_test.txt")
subject<-rbind(strain,stest)
names(subject)<-"subject"

#merging the activity,subject and merged dataset with column names of mean and std
final<-cbind(mergefinal,activity,subject)

#Grouping the dataset with respect to activityname and subjecy
k<-group_by(final,activityname,subject)
result<-summarise_each(k,funs(mean))


#Writing the final data into a text document
write.table(result,file="tidydata.txt",col.names = TRUE)




