Data Cleaning using PySpark
Project Overview

This project focuses on performing data cleaning and preprocessing using PySpark, an essential step in any data engineering pipeline. Raw datasets often contain missing values, inconsistent formatting, duplicate records, and invalid entries that can affect analysis and machine learning performance.

The objective of this project is to transform raw CSV data into a clean, structured, and reliable dataset suitable for analytics and downstream applications.

The workflow follows standard ETL (Extract, Transform, Load) practices widely used in industry.

Technologies Used
Python
PySpark
Apache Spark
Databricks Environment
CSV File Handling
Dataset Description

The dataset contains customer-related information such as:

Customer Name
Country
Product Category
Sales Amount
Join Date

The raw dataset includes typical data quality issues such as:

Missing values
Inconsistent text formatting
Duplicate records
Invalid numeric values
Non-standard country names
Data Cleaning Objectives

The main objectives of this project include:

Handling Missing Values

Missing or blank values are identified and replaced with appropriate default values to ensure data completeness.

Standardizing Text Data

Text columns such as Country and Category are standardized to maintain consistency across the dataset.

Correcting Invalid Entries

Incorrect location values and negative numerical values are corrected or removed to maintain data accuracy.

Removing Duplicate Records

Duplicate rows are eliminated to ensure each record represents unique information.

Ensuring Data Consistency

Formatting issues are resolved to maintain uniform structure across all columns.

Project Workflow
1. Data Extraction

The raw dataset is loaded into PySpark for processing.

2. Data Transformation

Several cleaning operations are applied:

Replace blank values with null values
Standardize categorical text fields
Handle missing data
Filter invalid records
Remove duplicate entries
3. Data Validation

The cleaned dataset is checked to ensure:

No missing critical values
No duplicate records
Valid numerical ranges
Consistent formatting
4. Data Storage

The cleaned dataset is saved for further analytics or machine learning use.

Key Learning Outcomes
Understanding the importance of data cleaning in real-world datasets
Applying PySpark transformations for preprocessing
Handling null and missing values effectively
Ensuring consistency in categorical data
Identifying and removing duplicate records
Preparing structured datasets for analytics
Building foundational ETL pipeline skills