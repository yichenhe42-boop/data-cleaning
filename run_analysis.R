# run_analysis.R
# Coursera Getting and Cleaning Data Course Project

# 1. load necessary packgae
library(dplyr)

# 2. set the right path
path <- "./UCI HAR Dataset"

# 3. read the files
features <- read.table(file.path(path, "features.txt"), col.names = c("id", "name"))
activity_labels <- read.table(file.path(path, "activity_labels.txt"), col.names = c("id", "activity"))

# 4. read the train set
subject_train <- read.table(file.path(path, "train", "subject_train.txt"), col.names = "subject")
x_train <- read.table(file.path(path, "train", "X_train.txt"), col.names = features$name)
y_train <- read.table(file.path(path, "train", "y_train.txt"), col.names = "activity")
train <- cbind(subject_train, y_train, x_train)

# 5. read the test sets
subject_test <- read.table(file.path(path, "test", "subject_test.txt"), col.names = "subject")
x_test <- read.table(file.path(path, "test", "X_test.txt"), col.names = features$name)
y_test <- read.table(file.path(path, "test", "y_test.txt"), col.names = "activity")
test <- cbind(subject_test, y_test, x_test)

# 6. merge two of them
all_data <- rbind(train, test)

# 7. sort those columns that only contain mean and std （save subject and activity）
mean_std_cols <- grep("subject|activity|mean\\(|std\\(", names(all_data), value = TRUE)
selected_data <- all_data[, mean_std_cols]

# 8. use activity lables（substitute the number of those columns of activity into numbers）
selected_data$activity <- factor(selected_data$activity,
                                 levels = activity_labels$id,
                                 labels = activity_labels$activity)

# 9. perfect variables' names
names(selected_data) <- gsub("-mean\\(\\)", "_mean", names(selected_data))
names(selected_data) <- gsub("-std\\(\\)", "_std", names(selected_data))
names(selected_data) <- gsub("-", "_", names(selected_data))
names(selected_data) <- gsub("\\(", "", names(selected_data))
names(selected_data) <- gsub("\\)", "", names(selected_data))

# 10. create the second tidy data sets：every variavle has done the mean to subject and activity
tidy_data <- selected_data %>%
        group_by(subject, activity) %>%
        summarise_all(mean)

# 11. output
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

#optional
head(tidy_data)