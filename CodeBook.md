# Code Book

## Data Source
UCI Human Activity Recognition Using Smartphones Dataset

## Transformations
- Merged training and test sets.
- Extracted only mean and standard deviation measurements.
- Used descriptive activity names.
- Renamed variables with descriptive names.
- Averaged each variable by activity and subject.

## Variables
- `subject` : ID (1-30)
- `activity` : One of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- Other variables: averages of mean and standard deviation measurements, normalized between -1 and 1.

For a complete list of measurement variables, refer to the original `features.txt`.
