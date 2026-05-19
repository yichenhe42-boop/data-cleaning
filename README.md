# Getting and Cleaning Data Course Project

This script `run_analysis.R` does the following:
1. Merges training and test sets.
2. Extracts only mean and standard deviation measurements.
3. Uses descriptive activity names.
4. Labels variables appropriately.
5. Creates a second tidy dataset with averages per subject and activity.

## How to run
- Place the script in the same directory as the `UCI HAR Dataset` folder.
- Run `source("run_analysis.R")` in R.
- Output file `tidy_data.txt` will be created.
