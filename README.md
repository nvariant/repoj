The code is divided into 3 scripts, called in this order from
run_analysis.R:

merge.datasets.R
extract.mean.std.R
extract.tidy.R

###merge.datasets.R

## Section 1: reading in test data

This section reads in the -test- data, removes the extra
spaces in the data, writes that data to a file and reads
it back in as a properly formed dataframe. 

It adds to that dataframe the columns for subject and
activity, which are also read from files.


## Section 2: reading in train data

This section reads in the -train- data, removes the extra
spaces in the data, writes that data to a file and reads
it back in as a properly formed dataframe. 

It adds to that dataframe the columns for subject and
activity, which are also read from files.
This section also joins the train and test dataframes into
a single dataframe, full.df


## Section 3: adding the 561 features names 

This section adds the 561 feature names to the table 
obtained by reading in the file of feature names. In 
addition, duplicated column names are made unique with make.unique()


## Section 4: reading in activity labels and joining data

This section reads in the activity labels and changes them to
lower case. The activity names are joined with the combined
train and test dataframe data, using the data.table package 
for a faster merge..


### extract.mean.std.R

This script extracts the columns the columns 
having mean and standard deviation, along with the 
subject and activity columns, from the dataset. 

This uses "grep()" to find the columns contining the mean
and standard deviation values in the data.


### extract.tidy.R

This script extracts the tidy data dataset using melt and 
dcast from the reshape2 package. 

