Phase 2 – Data Transformation using PySpark
🔹 Objective

The objective of this phase is to transform raw datasets into structured and meaningful analytical outputs using PySpark. The focus is on applying data transformation techniques such as joins, filtering, and aggregations to convert raw transactional data into useful business insights.

🔹 Problem Summary

Multiple datasets containing transactional and customer-related information were provided. These datasets were interrelated and required integration to perform analysis.

The main tasks involved:

• Merging datasets from different sources
• Performing aggregations to calculate business metrics
• Extracting insights from transactional records

The transformation process enables raw data to be converted into structured information that supports decision-making and reporting.

🔹 Approach
Step 1: Data Loading

All datasets were loaded into PySpark DataFrames using SparkSession. The schema of each dataset was validated to ensure compatibility for transformation operations.

Step 2: Data Preprocessing

Data cleaning was performed to improve data quality before applying transformations:

• Checked for missing or null values in key columns
• Removed or handled null values where necessary
• Ensured proper data types for numerical and categorical columns

Step 3: Data Joining

Multiple datasets were combined using appropriate join operations based on common identifiers such as:

• customer_id
• order_id

Joins helped create a consolidated dataset that connects customer information with order details.

Step 4: Data Transformation

Various transformation techniques were applied to extract insights:

• Applied filtering conditions to remove irrelevant records
• Grouped data using groupBy() for analysis
• Used aggregation functions to compute summary statistics

Step 5: Result Generation

Final transformed datasets were generated and stored for analysis and validation. These outputs provide summarized insights that can be used for reporting purposes.

🔹 Key Transformations Used

• join() → combines multiple datasets into a unified structure
• groupBy() → groups data based on specified columns
• agg() → calculates aggregated metrics such as total and count
• filter() → removes records that do not meet required conditions
• select() → extracts required columns for final output

🔹 Output / Results

The transformation process produced structured outputs that summarize transactional and customer-level information.

Key results include:

• Aggregated metrics at customer level
• Summary statistics derived from transactional data
• Clean and structured dataset ready for analysis

Output screenshots are available in the outputs/ folder.

🔹 Data Engineering Considerations

• Ensured data consistency before performing joins
• Handled null values carefully to avoid incorrect results
• Verified join conditions to prevent duplicate records
• Validated outputs using sample data checks

🔹 Challenges Faced

• Identifying correct join keys between datasets
• Handling null values present in important columns
• Ensuring transformations produce accurate aggregated results

🔹 Learnings

• Practical understanding of DataFrame transformations in PySpark
• Importance of preprocessing before performing aggregations
• How joins help combine relational datasets
• How aggregated metrics support business insights

🔹 Files in this Folder

• solution.py → Contains PySpark transformation logic
• phase2_problem_statement.pdf → Description of the task
• outputs/ → Contains screenshots of results