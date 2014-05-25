## Code Book
-----------------------------------------------------------------------------------------------------
### Load unzipped raw ".txt" files
  1. using "table.read" to load "activity" and "feature" labels
  2. using "table.read" to load the meansurement, subject and activitiy files for "train" and "test" subfolders
  
### Make up the "test" resp. "train" data set.
  1. using "cbind" to combine the generated data.frames "test_subject_id", "test_activity_id" and "testdata" into single "test_data"
  2. using "cbind" to combine the generated data.frames "train_subject_id", "train_activity_id" and "traindata" into signle "train_data"
  
### Combine the "test_data" and "train_data" into the all-inclusive data set "all_data"
  1. using "rbind" simply because they are strictly seperated (70% vs 30%) in experiments
  
### Select those "mean" or "std" measurement and add activity descirptive names
  1. using "grep" in all feature descriptions to identify interested variables
  2. subset the "all_data" to "mean_std_data" 
  3. using "merge" method on the "activity_id" to insert descirptive activity names. After then delete the "activity_id"
  
### Calculate the mean value of interested features and output the final result
  1. using "melt" on the combination of "activity_names" and "subject_id". As result, the "data_melt" is generated.
  2. using "dcast" on the "data_melt" with function "mean" the key pair (activity_name + subject_id)
