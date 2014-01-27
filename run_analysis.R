# run_analysis.R
# 
# This script requires that the Samsung data be in the working
# directory, as well as the three scripts being called: "merge_datasets.R",
# "extract.mean.std.r", and "extract.tidy.r". All three scripts require 
# that the package data.table be installed. The script "extract.tidy.r"
# additionally requires the reshape2 package be installed.

rm(list=ls())

source("merge.datasets.R")
source("extract.mean.std.R")
source("extract.tidy.R")
