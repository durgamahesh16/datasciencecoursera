xtrain, ytrain, xtest, ytest, subjecttrain and subjecttest contain the data from the downloaded files.
xdata, ydata and subjectdata merge the previous datasets to further analysis.
features contains the correct names for the xdata dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
all_data merges xdata, ydata and subject_data in a big dataset.
Finally, averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
