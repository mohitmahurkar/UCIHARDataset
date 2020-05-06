Description of steps undertaken to clean and reshape the data:

    Read the files containing the labels for activities and features of vector

    Read the test data

1. (#1)Read the data identifying subjects for test observations and rename columns (#2) Read the data containing the feture list for test observations and add descriptions (#3) Read the data identifying type of activity for test observations and rename columns (#4) Column bind files under (#1), (#2) and (#3) to get the complete table for test observations (#5) Keep only necessary columns, Subject.Id, Activity and columns containing mean in their description (#6) Add the description for activity type to produce the final test data for observations

    Read the training data

Reproduce steps (#1) -> (#6) for training data to get the final training data for observations

    Merge Training and Test data to create one data set (training and test data have the same format, they will be bound vertically)

    Reshape the merged data to produce the desired format for data aggregation

 (#16) Use the melt function to prepare data for dcast aggregation. (#17) Aggregate data with dcast function to produce the final (tidy) data set

    Finnaly write out to csv file the tidy data set in the Data folder.
