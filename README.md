# README  

## Getting and Cleaning Data Course Project

### Description  
This script processes the UCI HAR Dataset (Human Activity Recognition Using Smartphones) to produce a tidy dataset summarizing the average of mean and standard deviation measurements for each activity and subject.  

---

### Steps in the Script  

1. **Download and Extract Dataset**  
   - Downloads the dataset from the provided URL if it is not already available.  
   - Extracts the dataset to a local directory.  

2. **Load and Merge Data**  
   - Reads test and training datasets (features, activities, and subjects).  
   - Combines them into a single dataset.  

3. **Filter Relevant Data**  
   - Extracts measurements related to mean and standard deviation.  

4. **Label Activities**  
   - Replaces activity codes with descriptive activity names.  

5. **Create Tidy Dataset**  
   - Averages each variable for each activity and subject.  
   - Outputs the result to a file named `TidyDataSet.txt`.  

---

### Files Produced  
- **`TidyDataSet.txt`**: A tidy dataset with averages for each variable grouped by activity and subject.
- **'run_analysis.R'** : R code srcipt with the code used to create the Tidy Dataset.
- **'Codebook'**: A codebook which outline the steps used in the run_analysis.R script 

---

### How to Run  
1. Install the required `dplyr` package.  
2. Run the script in R or RStudio.  
3. The tidy dataset will be saved in the working directory as `TidyDataSet.txt`.  

