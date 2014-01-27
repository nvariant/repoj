# extract.mean.std.R

# This script extracts the columns the columns 
# having mean and standard deviation, along with the 
# subject and activity columns, from the dataset. 
# 
# This uses "grep()" to find the columns contining the mean
# and standard deviation values in the data.

require(data.table)

colnames <- names(full.dt)
meancols <- grep("[Mm]ean", colnames, value=TRUE)
stdcols <- grep("std()", colnames, fixed=TRUE, value=TRUE)
cols <- c("subject", "activity", meancols, stdcols)
extract <- full.dt[,cols, with=FALSE]
