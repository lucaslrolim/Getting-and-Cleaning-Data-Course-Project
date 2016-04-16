# observation: It wasn't coded following necessarily the order of activity specifications

# Read the translation file label / activity (activity_labels.txt)
activityLabel <- read.table("activity_labels.txt",col.names = c("label","activity"))

# Read features file and the measure names
features <- read.table("features.txt",col.names = c("id", "feature"))

# Select only desirable measures mapping ther indexes (desirable measures have "mean()" or  "std()" in the name)
desirableMeasurements <- grep( "(.*)+mean()+(.*)|(.*)+std()+(.*)", features$feature)

# Read the collected data from test and train datasets
testData <- read.table("./test/X_test.txt")
trainData <- read.table("./train/X_train.txt")

# Select only desirable columns (with measures about mean or std)
testData <- testData[desirableMeasurements]
trainData <- trainData[desirableMeasurements]

# Set the names of the columns according features file (assuming that the order of columns and the measure names in features file are correlated)
colnames(testData) <- features$feature[desirableMeasurements]
colnames(trainData) <- features$feature[desirableMeasurements]

# Read labels file and convert a label in a activity name
labelRecordTest <- read.table("./test/y_test.txt",col.names = "activitylabel")
labelRecordTrain <- read.table("./train/y_train.txt",col.names = "activitylabel")
maketrans <- function(x){
  activityLabel$activity[x]
}

# "Translate" all labels
labelRecordTest$activityname <- sapply(labelRecordTest$activitylabel,maketrans)
labelRecordTrain$activityname <- sapply(labelRecordTrain$activitylabel,maketrans)

# Add a column with activity name in each dataset
testData$activityname <- labelRecordTest$activityname
trainData$activityname <- labelRecordTrain$activityname

# [Extra] Add a column with origin of data in each dataset
testData$origin <- "test"
trainData$origin <- "train"

# Merge the data

Data <- rbind(testData,trainData)

# Read subject file
testSubj <- read.table("./test/subject_test.txt")
traintSubj <- read.table("./train/subject_train.txt")
Data2 <- Data

# Merge subject information from test and train file
Data2$subject <- rbind(testSubj,traintSubj)

# Use aggregate function to separate the mean by groups

avgData <- aggregate(Data2, by=list(Data2$activityname,Data2$subject$V1),FUN = mean)

# Just changing the column names for a better understanding
colnames(avgData) <- c("activity", "subject")


# Write the dataset to a file
write.table(avgData, "AnalysisResult.txt", sep="\t")