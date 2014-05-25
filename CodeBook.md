## Load unzipped raw ".txt" files
  1. using "table.read" to load "activity" and "feature" labels
  2. using "table.read" to load the meansurement, subject and activitiy files for "train" and "test" subfolders
  
## Make up the "test" resp. "train" data set.
  1. using "cbind" to combine the generated data.frames "test_subject_id", "test_activity_id" and "testdata" into single "test_data"
  2. using "cbind" to combine the generated data.frames "train_subject_id", "train_activity_id" and "traindata" into signle "train_data"
  
## Combine the "test_data" and "train_data" into the all-inclusive data set "all_data"
  1. using "rbind" simply because they are strictly seperated (70% vs 30%) in experiments
  
## Select those "mean" or "std" measurement and add activity descirptive names
  1. using "grep" in all feature descriptions
  2. using "merge" method on the "activity_id" to insert descirptive activity names.
  
## 
