#### Overview  
The script "run_analysis.R" uses r to perform data preparation activities on the UCI HAR Dataset (Human Activity Recognition Using Smartphones) to create a tidy dataset for analysis.
It performs the following steps:  
1. Downloads and unzips the dataset.  
2. Merges training and test datasets.  
3. Extracts mean and standard deviation measurements.  
4. Labels the data with descriptive activity names.  
5. Creates a tidy dataset with averages of each variable for each activity and subject.  

---

### Variables and Descriptions  

#### **Downloaded and Extracted Data**  
- `Url`: URL to download the UCI HAR Dataset.  
- `zipfile`: File name of the downloaded dataset ZIP file.  
- `path`: Folder name of the unzipped dataset.  

#### **Data Tables**  
- `xtest`: Test dataset containing feature measurements.  
- `ytest`: Test dataset containing activity codes.  
- `subject_test`: Test dataset containing subject IDs.  
- `xtrain`: Training dataset containing feature measurements.  
- `ytrain`: Training dataset containing activity codes.  
- `subject_train`: Training dataset containing subject IDs.  
- `features`: List of feature names.  
- `activity_labels`: Mapping of activity codes to descriptive activity names.  

#### **Merged Data**  
- `X_data`: Combined feature measurements from test and training datasets.  
- `Y_data`: Combined activity codes from test and training datasets.  
- `Subject_data`: Combined subject IDs from test and training datasets.  
- `Full_dataset`: Fully merged dataset combining subjects, activities, and features.  

#### **Filtered Data**  
- `mean_and_std`: Logical vector identifying columns with "mean" or "std" in their names, as well as `subject_code` and `activity_code`.  
- `meanandstd`: Subset of `Full_dataset` with only the mean and standard deviation measurements.  

#### **Final Tidy Dataset**  
- `TidyDataset`: Independent tidy dataset containing the average of each variable for each activity and subject.  

---

### Steps and Operations  

1. **Download and Unzip the Dataset**  
   - Checks if the dataset ZIP file exists; if not, downloads it from the URL.  
   - Unzips the dataset into the specified directory.  

2. **Load Data Files**  
   - Reads the test and training datasets (`X_test`, `Y_test`, `subject_test`, `X_train`, `Y_train`, `subject_train`) and supporting files (`features`, `activity_labels`).  

3. **Assign Descriptive Column Names**  
   - Assigns column names to datasets based on `features` and other descriptive labels.  

4. **Merge Data**  
   - Combines test and training datasets into unified datasets (`X_data`, `Y_data`, `Subject_data`).  
   - Creates `Full_dataset` by merging subject, activity, and feature data.  

5. **Filter Mean and Standard Deviation Measurements**  
   - Filters `Full_dataset` to include only measurements related to mean and standard deviation, along with subject and activity identifiers.  

6. **Add Descriptive Activity Names**  
   - Maps activity codes to descriptive activity names using `activity_labels`.  

7. **Create Final Tidy Dataset**  
   - Groups data by `subject_code` and `activity_code`.  
   - Calculates the average of each variable for each activity and each subject.  

8. **Write Tidy Dataset to File**  
   - Saves the tidy dataset to `TidyDataSet.txt`.  

---

### Output  

#### **Final Tidy Dataset (`TidyDataset`)**  
A dataset where:  
- Each row represents a unique combination of `subject_code` and `activity_code`.  
- Each column contains the average of a measurement variable (mean or standard deviation).  

#### **File Output**  
- `TidyDataSet.txt`: Final tidy dataset written as a plain text file.  

---

### Notes  
- Column names follow descriptive conventions for clarity.  
- Missing values are ignored during mean and standard deviation extraction.  
- The final tidy dataset is sorted by `subject_code` and `activity_code`.  
