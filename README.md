# gcd-prog2
getting and cleaning data - programming assignment

run_analysis.R - R script for the assignment. Produces
 gcd.txt. Requires the entire Samsung data to be placed
 as sub-folder. Run_analysis performs the following:

1) Reads the subject files (subject_train, subject_test)
2) Merges them
3) Sets the variable name of the data frame to be "Subject"
4) Reads in the data files (X_train, X_test)
5) Reads in the Feature file (features.txt)
6) Merges the data file
7) Renames the variables to the names contained in the Features file
8) Filters the data set to contain only the necessary variables (mean/std)
9) Reads the label file (y_train/y_test)
10) Reads the activity label file (activity_labels)
11) merges the label files
12) constructs a new data set as follows: 
  - First column is the Subject vector
  - Second column is the Activity Label vector (obtained by mapping the 
             label indices to their descriptive name)
  - Rest of the 79 columns contain the variables obtained in Step 8
13) constructs an aggregated data set from the data set in Step 12 as follows:
   - For each variable, compute the mean, group by Subject and Activity
14) Output to gcd.txt

gcd.txt - Dataset containing mean of all required variables, 
 grouped by Subject and Activity.



