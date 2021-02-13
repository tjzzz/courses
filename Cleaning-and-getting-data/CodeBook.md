
**subject**  
the person number of the volunteers.  
integer  
starts from 1 to 30

**activity**  
the six different type of activitys  
factor  
levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,STANDING, LAYING
    


The other 79 variables are the measurement correlated with mean and standard deviation values. The values are all numeric between -1 and 1.

1. "mean" and "std" are the mean and standard deviation
2. X,Y,Z are the three dimension axis.

The acceleration signal was then separated into body and gravity acceleration signals  
tBodyAcc  
tGravityAcc

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals:  
tBodyAccJerk  
tBodyGyroJerk 

Magnitude of these three-dimensional signals were calculated using the Euclidean norm producing:  
    tBodyAccMag  
    tGravityAccMag  
    tBodyAccJerkMag  
    tBodyGyroMag  
    tBodyGyroJerkMag   

Fast Fourier Transform (FFT) was applied to some of these signals producing:  
    fBodyAcc  
    fBodyAccJerk  
    fBodyGyro  
    fBodyAccJerkMag  
    fBodyGyroMag  
    fBodyGyroJerkMag.   
 
