library(plyr)

# Step 1

xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")

xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")
features <- read.table("features.txt")

xdata <- rbind(xtrain, xtest)

ydata <- rbind(ytrain, ytest)

subjectdata <- rbind(subjecttrain, subjecttest)
activities <- read.table("activity_labels.txt")


mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])


xdata <- xdata[, mean_and_std_features]


names(xdata) <- features[mean_and_std_features, 2]




ydata[, 1] <- activities[ydata[, 1], 2]


names(ydata) <- "activity"

# Step 4


names(subjectdata) <- "subject"


all_data <- cbind(xdata, ydata, subjectdata)

# Step 5

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
