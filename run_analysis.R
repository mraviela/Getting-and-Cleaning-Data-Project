## Variables declaration

## Data File & Data Dir
ds_dir <- "UCI HAR Dataset"
ds_file <- "Dataset.zip"


## Custom columns
subject_col <- "Subject"
activity_col <- "Activity"

## Functions declarations

## Verifies libraries dependencies
verify_deps <- function(...) {
  print("Library dependencies verification")
  lapply(list(...), function(lib) {
    if (!lib %in% installed.packages()) 
      install.packages(lib)
  })
}

## Loads a file (filename to load)
load_file <- function(filename, ...) {
  print(paste("Loading file:",filename))
  file.path(..., filename) %>%
    read.table(header = FALSE)
}

## Loads training file
load_train_file <- function(filename) {
  load_file(filename, ds_dir, "train")
}

## Loads test file
load_test_file <- function(filename) {
  load_file(filename, ds_dir, "test")
}

## To get the original dataset with human readable column name and values
describe_lbl_ds <- function(ds) {
  names(ds) <- activity_col  
  ds$Activity <- factor(ds$Activity, levels = activity_lbl$V1, labels = activity_lbl$V2)
  ds
}

## To get the original dataset with columns indicating which feature it describes
describe_act_ds <- function(ds) {
  col_names <- gsub("-", "_", features$V2)
  col_names <- gsub("[^a-zA-Z\\d_]", "", col_names)
  names(ds) <- make.names(names = col_names, unique = TRUE, allow_ = TRUE)
  ds
}

## Adjusts to column name identifying test participants
describe_sub_ds <- function(ds) {
  names(ds) <- subject_col
  ds
}

## Main execution starts
print("run_analysis process started.")
## Verify dependencies
verify_deps("dplyr", "reshape2")

## Load the dependencies
print("Loading needed libraries")
library("dplyr")
library("reshape2")

## Download and extract a zip file with datasets
if (!file.exists(ds_file)) {
  print("Downloading datafile ...")
  source_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(source_url, destfile = ds_file, method = "curl")
  print("Unziping dataset file ...")
  unzip(ds_file)
  if (!file.exists(ds_dir)) 
    stop("The downloaded dataset doesn't have the expected structure!")
}

##Unzips file if already exists but was not unziped
if (!file.exists(ds_dir)) {
  print("Unziping dataset file ...")
  unzip(ds_file)
  if (!file.exists(ds_dir)) 
    stop("The downloaded dataset doesn't have the expected structure!")
}

## Load features as human-readable column names
features <- load_file("features.txt", ds_dir)

## Load activity labels
activity_lbl <- load_file("activity_labels.txt", ds_dir)

## Use descriptive activity/label names to name the activities
train_set <- load_train_file("X_train.txt") %>% describe_act_ds
train_lbl <- load_train_file("y_train.txt") %>% describe_lbl_ds
train_sub <- load_train_file("subject_train.txt") %>% describe_sub_ds

test_set <- load_test_file("X_test.txt") %>% describe_act_ds
test_lbl <- load_test_file("y_test.txt") %>% describe_lbl_ds
test_sub <- load_test_file("subject_test.txt") %>% describe_sub_ds

## Merge training and test data sets 
## Extract only the mean and standard deviation for each measurement
print("Merging training and test data sets")
merged_data <- rbind(
  cbind(train_set, train_lbl, train_sub),
  cbind(test_set, test_lbl, test_sub)
) %>%
  select(
    matches("mean|std"), 
    one_of(subject_col, activity_col)
  )

## Create independent tidy data set with the average of each variable for each activity and subject
id_cols <- c(subject_col, activity_col)
print("Creating tidy dataset")
tidy_data <- melt(
  merged_data, 
  id = id_cols, 
  measure.vars = setdiff(colnames(merged_data), id_cols)
) %>%
  dcast(Subject + Activity ~ variable, mean)

## Save the results
print("generating file: tidy_data.txt as required")
write.table(tidy_data, file = "tidy_data.txt", sep = ",", row.names = FALSE)

print("generating file: tidy_data.csv because is nice")
write.table(tidy_data, file = "tidy_data.csv", sep = ",", row.names = FALSE)

print("run_analysis process is complete.")