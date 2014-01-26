The code is divided into 6 funcitonal sections, explained below. The data.table package is required and is installed in section 3. If it is already installed, the install.packages() line can be commented out. The data table package is used in the subsequent sections.


### Section 1: reading in test data

This section reads in the -test- data, removes the extra
spaces in the data, writes that data to a file and reads
it back in as a properly formed dataframe. 

It adds to that dataframe the columns for subject and
activity, which are also read from files.


### Section 2: reading in train data

This section reads in the -train- data, removes the extra
spaces in the data, writes that data to a file and reads
it back in as a properly formed dataframe. 

It adds to that dataframe the columns for subject and
activity, which are also read from files.
This section also joins the train and test dataframes into
a single dataframe, full.df


### Section 3: reading in activity labels and joining data

This section reads in the activity labels and joins that data
with the combined train and test dataframe data, using the 
data.table package. The activity labels are changed to
lower case with tolower().


### Section 4: adding the 561 features names 

This section adds the 561 feature names to the table 
obtained by reading in the file of feature names.


### Section 5: extracting the columns having mean and standard deviation

This section extracts the columns of interest
using "grep()" to find the columns contining the mean
and standard deviation values in the data.


### Section 6: Extracting the tidy dataset

This section extracts the tidy data dataset using
the data.table variable ".SD". A data.table "tidy.data"
is produced, and a csv file is created for submission
of the assignment.

".SD is a data.table containing the subset 
of x's data for each group, excluding 
the group column(s). When grouping, the 
j expression can use column names as variables 
but it can also use a reserved symbol.SD which 
refers to the Subset of the Data.table For each 
group (excluding the grouping columns). So to sum up 
all your columns it's just DT[,lapply(.SD,sum),by=grp]"
  -(From data.table faq 2.1)
