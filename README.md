Getting and Cleaning Data
=========================

Repository for the Getting and Cleaning Data course @ Coursera.

In order to execute the run_analysis.R script, you need to set the current working directory in a folder containing the
following files:

- activity_labels.txt
- features.txt
- subject_train.txt
- train/y_train.txt
- train/X_train.txt
- train/subject_test.txt
- test/y_test.txt
- test/X_test.txt

The execution of run_analysis.R create a tidy data set and write a file named *tidydata.txt*.

Remember, a tidy data set has the following caracteristics:

- each variables form a column
- each observations form a row
- each table store data about one class of experimental unit