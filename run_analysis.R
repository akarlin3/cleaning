folder <- "getdata/data"
testData <- read.table(file.path(folder, 'test', 'X_test.txt'))
testActivities <- read.table(file.path(folder, 'test', 'y_test.txt'))
testSubjects <- read.table(file.path(folder, 'test', 'subject_test.txt'))
trainData <- read.table(file.path(folder, 'train', 'X_train.txt'))
trainActivities <- read.table(file.path(folder, 'train', 'y_train.txt'))
trainSubjects <- read.table(file.path(folder, 'train', 'subject_train.txt'))
activityLabels <- read.table(file.path(folder, '.','activity_labels.txt'))
featuresLabels <- read.table(file.path(folder, '.', 'features.txt'))
dftest <- data.frame(testData)
dftrain <- data.frame(trainData)
df <- rbind(dftest, dftrain)
names(df) <- featuresLabels[,2]
nameVar <- names(df)
newdf <- data.frame(Name = nameVar, Mean = apply(df, 2, mean), 
                    StdDev = apply(df, 2, sd))
write.table(newdf, file = "file.out")
