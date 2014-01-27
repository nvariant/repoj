#############################################

# extract.tidy.R

###############################################33

# This script extracts the tidy data dataset using melt and 
# dcast from the reshape2 package. 

require(data.table)
require(reshape2)

melted <- melt(full.dt,(id.vars=c(1:2)))
tidy.data <- dcast(melted, subject + activity  ~ variable, mean)
