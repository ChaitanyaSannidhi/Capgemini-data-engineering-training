Below are **well-structured reflection answers** for **Phase 5 – PySpark & Databricks Data Engineering Project**, written in a professional academic style suitable for assignments, viva, or documentation.

---

# Reflection Questions – Phase 5 (PySpark & Databricks)

## 1. What challenges did you face in setup?

During the setup phase, the primary challenge was configuring the **Databricks environment** and ensuring all datasets were correctly loaded into the **Lakehouse storage**. Since the project uses multiple CSV files (orders, customers, products, payments, etc.), maintaining the correct file paths and schema consistency was essential.

Another challenge was related to **data type mismatches**, especially timestamp columns such as:

* order_purchase_timestamp
* order_delivered_customer_date
* order_estimated_delivery_date

These columns were initially read as string types and required conversion into proper timestamp format using PySpark functions like `to_timestamp()`.

Additionally, ensuring that the Spark session recognized all datasets and that there were no missing or corrupted records required careful validation steps. Understanding the folder structure in Databricks workspace and referencing files correctly also required attention.

Overall, the setup process helped in understanding how real-world data engineering projects involve careful configuration before analysis begins.

---

## 2. How did you validate joins?

Join validation was performed to ensure that relationships between datasets were accurate and consistent. Since the project involved multiple related tables, maintaining **referential integrity** was important.

For example:

* orders table was joined with customers using customer_id
* order_items table was joined with orders using order_id
* payments table was joined with orders using order_id

To validate joins, the following checks were performed:

* Row count comparison before and after join
* Checking for null values in join keys
* Identifying unmatched records using left join
* Ensuring no unintended data duplication occurred

Example validation approach:
If the number of order records significantly increased after joining with order_items, it indicated multiple products per order, which is expected. However, unexpected row increases could indicate incorrect join logic.

These checks ensured that the joins were logically correct and maintained data consistency across tables.

---

## 3. How did window functions help?

Window functions were very useful for performing advanced analytical operations without losing row-level information.

They allowed calculations across a group of rows while still preserving individual records. This is especially helpful in business analytics scenarios.

Some examples from the project:

### Ranking customers within each city

Using DENSE_RANK or RANK helped identify top customers based on purchase amount in each city.

### Running total of sales

Using cumulative SUM helped track how revenue grows over time.

### Product performance analysis

Ranking products within each category helped identify best-performing products.

Advantages of window functions:

* No need to collapse data using GROUP BY
* Enables advanced analytics like ranking and cumulative metrics
* Improves readability and efficiency of queries
* Useful for business insights such as customer segmentation

Window functions are widely used in real-world analytics and data engineering pipelines.

---

## 4. Can you explain your pipeline?

The data pipeline in Phase 5 follows a structured ETL approach using PySpark in Databricks environment.

### Step 1: Extract

Data was extracted from CSV files stored in the Databricks workspace. Spark automatically inferred schema and loaded data into DataFrames.

### Step 2: Transform

Data transformation included:

* Converting string columns into timestamp format
* Handling missing values
* Selecting relevant columns
* Joining multiple datasets
* Aggregating values such as total purchase amount
* Applying window functions for ranking and cumulative metrics

Example transformations:

* Calculating customer lifetime value
* Identifying top products per category
* Computing running total of daily sales

### Step 3: Load

The transformed data was stored as structured DataFrames which can be further saved as:

* Delta tables
* Parquet files
* Temporary views for SQL querying

### Overall Pipeline Flow

Raw Data → Data Cleaning → Join Tables → Apply Transformations → Analytical Output

This pipeline demonstrates how raw transactional data can be converted into meaningful insights using PySpark.

---

If you want, I can also provide:

* Short 2-minute oral answer version
* Diagram of the pipeline
* Viva questions from Phase 5
* Resume bullet points for Phase 5 project
