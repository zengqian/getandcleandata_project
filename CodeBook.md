##Human Activity Recognition Using Smartphones Dataset

##Dataset description

The data come from an experiment carried out with a group of 30 volunteers. 

Each person performed six activities:

 - Walking
 - Walking upstairs
 - Walking downstairs
 - Sitting
 - Standing
 - Laying

while wearing a smartphone on the waist. 

Using the embedded accelerometer and gyroscope, they captured the time valued 3-axial linear acceleration (tAcc-XYZ) and 3-axial angular velocity (tGyro-XYZ) at a constant rate of 50 Hz.

The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

## Variables description

We have the following description:

 - subject_id: subject unique identifier
 - activity: activity name
 - bodyacc: body acceleration signal
 - gravityacc: gravity acceleration signal
 - bodyaccjerk: jerk body acceleration signal
 - bodygyro: body gyroscopic signal
 - bodygyrojerk: jerk body gyroscopic signal
 - bodyaccmag: magnitude of the body acceleration signal
 - gravityaccmag: magnitude of the gravity acceleration signal
 - bodyaccjerkmag: magnitude of the jerk body acceleration signal
 - bodygyromag: magnitude of the body gyroscopic signal
 - bodygyrojerkmag: magnitude of the jerk body gyroscopic signal

From these, we obtain:

 - subject_id
 - activity
 - [t|f]bodyacc_[mean|std]_[x|y|z]
 - [t|f]gravityacc_[mean|std]_[x|y|z]
 - [t|f]bodyaccjerk_[mean|std]_[x|y|z]
 - [t|f]bodygyro_[mean|std]_[x|y|z]
 - [t|f]bodygyrojerk_[mean|std]_[x|y|z]
 - [t|f]bodyaccmag_[mean|std]
 - [t|f]gravityaccmag_[mean|std]
 - [t|f]bodyaccjerkmag_[mean|std]
 - [t|f]bodygyromag_[mean|std]
 - [t|f]bodygyrojerkmag_[mean|std]

Where we use the [t|f]bodyacc_[mean|std]_[x|y|z] notation to represent the mean (standard deviation) value of the time (frequency) valued body acceleration signal in the X (Y or Z) direction.

We obtain a total of 68 variables.

## Transformation

Each transformations made on the raw data are explained in details in the comments in the run_analysis.R script.

In general, we transformed the variables names as:

 - Lower case
 - Remove dots and white spaces

Subsequently, we compute the average of each variable for each activity and each subject

## Notes

 1. *Jerk* is the time rate of change of acceleration.
 2. Each variables are normalized and bounded within [-1, 1].
 3. Each variables vector is a row in the text file.
 4. The tidy dataset is a 180-by-68 data frame.
 5. The standard deviation can be negative due to normalization.