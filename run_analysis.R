library(data.table)

# Read in the subject indices
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

# merge and set the name
subject <- rbind(subject_train, subject_test)
names(subject) <- "Subject"

# Read in the core data set and its feature vector
data_train<-read.table("train/X_train.txt")
data_test<-read.table("test/X_test.txt")
features<-read.table("features.txt")

# Merge the data files
merged_data<-rbind(data_train, data_test)

# Rename with the Features
names(merged_data)<-features$V2
features<-names(merged_data)

# Calculate the required features (mean/std for each feature)
required_features<-sort(c(grep("mean", features), grep("std", features)))

# Subset to get only the necessary features
dataset <- data.table(merged_data[,required_features])

# Read the labels
label_train<-read.table("train/y_train.txt")
label_test<-read.table("test/y_test.txt")

# Read the activity label file
activity<-data.table(read.table("activity_labels.txt"))

# Merge the labels to a single data table, join with activity to get the 
# descriptive label in as well
labels<-data.table(rbind(label_train, label_test))

# Construct the final data set
# First column is the subject
# Second column is the activity id transformed to its descriptive label
# third to end is the features obtained earlier by filtering
new_dataset <- data.table(cbind(subject, activity[labels[,V1],V2], dataset))
# update the name of the second column
names(new_dataset)[2]<-"Activity"

# aggregate the dataset - compute mean for each variable, group by
# subject and activity
aggregated<-new_dataset[,lapply(.SD,mean),by=c("Subject", "Activity")]

write.table(aggregated, file="gcd.txt", row.names=FALSE)



