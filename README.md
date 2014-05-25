
Getting and Cleaning Data Course Project
========================================
This file describes how run_analysis.R script works.
* 1unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "data".
* Make sure the folder "data" and the run_analysis.R script are both in the current working directory.
* 2 use source("run_analysis.R") command in RStudio. 
* 3 you will find two output files are generated in the current working directory:
  - merged_data.txt (7.9 Mb): it contains a data frame called cleanedData with 10299*68 dimension.
  - data_with_means.txt (220 Kb): it contains a data frame called result with 180*68 dimension.

## For detailed workflow of this script,
## please see the comments in the code "run_analysis.R"