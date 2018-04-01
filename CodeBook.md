# CodeBook 
The goal for the code book is to describe the contents and structure of ***tidy_data.txt***, is also know as Data Dictionary.

By running the script ***run_analysis.R*** the file ***tidy_data.txt*** is generated, using as input the original data that can be download from next url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip script execution automatically downloads the zip file.

***tidy_data.txt*** is a plain txt file, all fields are separated by ***,*** (comma)

Information about original data set can be found in next url http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Transformation process
1. Load training and the test data files.
2. Merge the training and the test data sets to creating one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Using descriptive activity names to rename the activities in the merged data set.
5. Appropriately labels the merged data set with descriptive variable names.
6. Using merged data set, is created the final, independent tidy data set with the average of each variable for each activity and each subject.

## Data fields

   All datafields are in ***bold***

* ***Subject***.- Numeric value that identifies subject observations.                           
* ***Activity***.- String value, with next possible values:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

* Next fields are all numeric.

    The time domain signals were captured at a constant rate of 50 Hz, prefix 't' denotes time.
  
* The body acceleration signals mean: 
    - ***tBodyAcc_mean_X***                   
    - ***tBodyAcc_mean_Y***                  
    - ***tBodyAcc_mean_Z*** 

* The body acceleration signals std:
    - ***tBodyAcc_std_X***                   
    - ***tBodyAcc_std_Y***                    
    -  ***tBodyAcc_std_Z***  

* The gravity acceleration signals mean: 
    - ***tGravityAcc_mean_X***                
    - ***tGravityAcc_mean_Y***               
    - ***tGravityAcc_mean_Z***

* The gravity acceleration signals std: 
    - ***tGravityAcc_std_X***                
    - ***tGravityAcc_std_Y***                 
    - ***tGravityAcc_std_Z*** 

* Body linear acceleration derived in time to obtain Jerk signals mean:
    - ***tBodyAccJerk_mean_X***               
    - ***tBodyAccJerk_mean_Y***              
    - ***tBodyAccJerk_mean_Z***  

* Body linear acceleration derived in time to obtain Jerk signals std:
    - ***tBodyAccJerk_std_X***               
    - ***tBodyAccJerk_std_Y***                
    - ***tBodyAccJerk_std_Z***

* Body angular velocity derived in time to obtain signals mean:
    - ***tBodyGyro_mean_X***                  
    - ***tBodyGyro_mean_Y***                 
    - ***tBodyGyro_mean_Z***

* Body angular velocity derived in time to obtain signals std:
    - ***tBodyGyro_std_X***                  
    - ***tBodyGyro_std_Y***                   
    - ***tBodyGyro_std_Z***

* Body angular velocity derived in time to obtain Jerk signals mean:
    - ***tBodyGyroJerk_mean_X***              
    - ***tBodyGyroJerk_mean_Y***             
    - ***tBodyGyroJerk_mean_Z***

* Body angular velocity derived in time to obtain Jerk signals std:
    - ***tBodyGyroJerk_std_X***              
    - ***tBodyGyroJerk_std_Y***               
    - ***tBodyGyroJerk_std_Z*** 

* The magnitude of these three-dimensional signals were calculated using the Euclidean form, next fields represent the mean or std value:

    - ***tBodyAccMag_mean***                  
    - ***tBodyAccMag_std***

    - ***tGravityAccMag_mean***               
    - ***tGravityAccMag_std*** 

    - ***tBodyAccJerkMag_mean***              
    - ***tBodyAccJerkMag_std*** 

    - ***tBodyGyroMag_mean***                 
    - ***tBodyGyroMag_std*** 

    - ***tBodyGyroJerkMag_mean***             
    - ***tBodyGyroJerkMag_std*** 

* Fast Fourier Transform (FFT) was applied to some of these signals, prefix 'f' indicates frequency domain signals, suffix indicate mean, std and axis:

    - ***fBodyAcc_mean_X***                   
    - ***fBodyAcc_mean_Y*** 
    - ***fBodyAcc_mean_Z***                   

    - ***fBodyAcc_std_X***
    - ***fBodyAcc_std_Y***                    
    - ***fBodyAcc_std_Z***

    - ***fBodyAcc_meanFreq_X***               
    - ***fBodyAcc_meanFreq_Y***
    - ***fBodyAcc_meanFreq_Z***               

    - ***fBodyAccJerk_mean_X***
    - ***fBodyAccJerk_mean_Y***               
    - ***fBodyAccJerk_mean_Z***

    - ***fBodyAccJerk_std_X***                
    - ***fBodyAccJerk_std_Y***
    - ***fBodyAccJerk_std_Z***                

    - ***fBodyAccJerk_meanFreq_X***
    - ***fBodyAccJerk_meanFreq_Y***           
    - ***fBodyAccJerk_meanFreq_Z***          

    - ***fBodyGyro_mean_X***                  
    - ***fBodyGyro_mean_Y***                 
    - ***fBodyGyro_mean_Z***                  

    - ***fBodyGyro_std_X***                  
    - ***fBodyGyro_std_Y***                   
    - ***fBodyGyro_std_Z***                  

    - ***fBodyGyro_meanFreq_X***              
    - ***fBodyGyro_meanFreq_Y***             
    - ***fBodyGyro_meanFreq_Z***              

    - ***fBodyAccMag_mean***                 
    - ***fBodyAccMag_std***                   
    - ***fBodyAccMag_meanFreq***             

    - ***fBodyBodyAccJerkMag_mean***          
    - ***fBodyBodyAccJerkMag_std***          
    - ***fBodyBodyAccJerkMag_meanFreq***      

    - ***fBodyBodyGyroMag_mean***            
    - ***fBodyBodyGyroMag_std***              
    - ***fBodyBodyGyroMag_meanFreq***        

    - ***fBodyBodyGyroJerkMag_mean***         
    - ***fBodyBodyGyroJerkMag_std***         
    - ***fBodyBodyGyroJerkMag_meanFreq***     


* The next fields represent estimated variables, such as mean value, standard deviation, largest and smalles value in the set etc

    - ***angletBodyAccMeangravity***         
    - ***angletBodyAccJerkMeangravityMean***  
    - ***angletBodyGyroMeangravityMean***    
    - ***angletBodyGyroJerkMeangravityMean*** 
    - ***angleXgravityMean***                
    - ***angleYgravityMean***                 
    - ***angleZgravityMean*** 


