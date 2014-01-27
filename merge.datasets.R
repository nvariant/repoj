####################

# merge.datasets.R
# 
# This script requires that the Samsung data is in your
# working directory. It also requires the data.table package
# be installed

##########################################

#### Section 1: reading in test data

# This section reads in the _test_ data, removes the extra
# spaces in the data, writes that data to a file and reads
# it back in as a properly formed dataframe. 
# 
# It adds to that dataframe the columns for subject and
# activity, which are also read from files.

require(data.table)

test.vals.raw <- readLines("./test/X_test.txt")
test.vals.sub <-gsub("\\s+","|",test.vals.raw)
write.table(test.vals.sub, "test.vals.sub", 
    row.names=F, quote=F, sep="")
test.vals<- read.table("test.vals.sub", 
    sep="|", quote="", skip=1,colClasses="character") 
test.vals <- test.vals[,-1]
test.vals <- apply(as.matrix(test.vals), 2, as.numeric)

test.activity <- read.table("./test/y_test.txt")
names(test.activity) <- c("activity")

test.subject <- read.table("./test/subject_test.txt")
names(test.subject) <- c("subject")

test.df <- cbind(test.subject, test.activity, test.vals)

################################

#### Section 2: reading in train data

# This section reads in the _train_ data, removes the extra
# spaces in the data, writes that data to a file and reads
# it back in as a properly formed dataframe. 
# 
# It adds to that dataframe the columns for subject and
# activity, which are also read from files.
# This section also joins the train and test dataframes into
# a single dataframe, full.df

train.vals.raw <- readLines("./train/X_train.txt")
train.vals.sub <-gsub("\\s+","|",train.vals.raw)
write.table(train.vals.sub, "train.vals.sub", 
    row.names=F, quote=F, sep="")
train.vals<- read.table("train.vals.sub", 
    sep="|", quote="", skip=1, colClasses="character")
train.vals <- train.vals[,-1]
train.vals <- apply(as.matrix(train.vals), 2, as.numeric)

train.activity <- read.table("./train/y_train.txt")
names(train.activity) <- c("activity")

train.subject <- read.table("./train/subject_train.txt")
names(train.subject) <- c("subject")

train.df <- cbind(train.subject, train.activity, train.vals)

full.df <- rbind(train.df,test.df)

###########################################


##### Section 3: adding the 561 features names 

# This section adds the 561 feature names to the table 
# obtained by reading in the file of feature names. In 
# addition, duplicated column names are repaired with make.unique()

features <- read.table("features.txt", sep=" ", colClasses = "character")
feat.names <-make.unique(features[, 1])
length(feat.names)

names(full.df)[3:563] <- feat.names

#################################


#### Section 4: reading in activity labels and joining data

# This section reads in the activity labels and changes them to
# lower case. The activity names are joined with the combined
# train and test dataframe data, using the data.table package 
# for a faster merge.

activity.labs <- read.table("activity_labels.txt", sep=" ")
names(activity.labs) <- c("activity","labels" )
activity.labs[,2] <- tolower(activity.labs[,2])
activity.dt <- data.table(activity.labs)
activity.dt$activity <- as.integer(activity.dt$activity)
setkey(activity.dt, activity)

full.dt <- data.table(full.df)
setkey(full.dt, activity)

full.dt <- merge(activity.dt, full.dt, all=TRUE)
full.dt$activity <- NULL
setnames(full.dt,1,"activity")
