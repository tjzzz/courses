

This work aims to clean the raw data about wearable computing and prepare the tidy data for later analysis.


The raw data
===============

The raw data mianly come from the accelerometer and gyroscope 3-axial raw signals tAcc and tGyro. 
It mainly include the following information:  
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope.  
- A 561-feature vector with time and frequency domain variables.  
- Its activity label.  
- An identifier of the subject who carried out the experiment



Scripts
===============

The main scripts are written in run_analysis.R. The code aims to merge the test and train data of subject, activity,measurement values and activity names.
The code cleans the data by the following way:

1.Read the following main data into R.  
  activity_label.txt  
  features.txt  
  subject_test.txt     
  X_test.txt        
  y_test.txt   

  subject_train.txt  
  X_train.txt        
  y_train.txt   

2.for the train and the test data:  
  (1)relate y_label and activity_labels to find out the activity name.  
  (2)combine subject,activity name,561 measurement data   
  (3)clean the feature data and name the columns of above data by the feature.  
  
3.combine the test and train data 

4.find the measurement that are mean and std and extract the subset.

5.calculate the average of each variable for each activity and each subject.

6.put out the tidy data.


Output:tidy data
===================
The main output is the tidy data and the information about the tidy data can be found in CodeBook.md file.










