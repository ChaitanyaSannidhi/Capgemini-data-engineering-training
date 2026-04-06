# Customer Bucketing & Segmentation Analysis

This project focuses on **Phase 4A** of the data processing pipeline, specifically leveraging **PySpark** to categorize and analyze customer purchasing behavior. By applying various segmentation techniques—ranging from simple conditional logic to machine learning transformers—this module transforms raw transaction data into actionable business intelligence.

---

## 🚀 Project Overview

The primary goal of this script is to take customer profiles and sales records, aggregate their spending, and divide the customer base into tiers (Gold, Silver, and Bronze). This allows for targeted marketing strategies and a deeper understanding of customer value distribution.

---

## 🛠️ Data Pipeline Stages

### 1. Environment & Session Initialization
The process begins by establishing a `SparkSession` titled **"Phase4A_Segmentation"**. This serves as the entry point for all Spark SQL and DataFrame operations, ensuring the distributed computing engine is ready to handle the datasets.

### 2. Data Acquisition & Type Casting
The pipeline ingests two core datasets:
* **Customers:** Demographic information including unique identifiers.
* **Sales:** Transaction logs containing purchase amounts.

To ensure mathematical accuracy, the `customer_id` is cast to an **Integer** type, and the `total_amount` is converted to a **Double** (floating-point) type. This prevents schema mismatches during joins and aggregations.

### 3. Feature Engineering: Total Spend
Before segmentation can occur, the data is joined on the common identifier and grouped. We calculate the **Total Spend** for every unique customer, creating a foundational metric for all subsequent analysis.

---

## 📊 Segmentation Methodologies

The project implements five distinct tasks to demonstrate different ways of "bucketing" data:

### Task 1: Conditional Segmentation (`when` logic)
This is a rule-based approach using hardcoded business thresholds. 
* **Gold:** Spend > 10,000
* **Silver:** Spend between 5,000 and 10,000
* **Bronze:** Everything else
This method is best when business goals are defined by specific revenue milestones.

### Task 2: Segment Distribution Analysis
Once segmented, the script performs a high-level aggregation to count how many customers fall into each tier. This provides a "bird's-eye view" of the health of the customer base.

### Task 3: Quantile-Based (Statistical) Segmentation
Unlike hardcoded tiers, this method uses the **`approxQuantile`** function to find the 33rd and 66th percentiles. 
* This ensures that the "Gold," "Silver," and "Bronze" groups are **statistically balanced**, containing roughly equal numbers of customers regardless of the absolute dollar amounts.

### Task 4: MLlib Bucketizer
We utilize the **`Bucketizer`** feature transformer from Spark’s Machine Learning library (`pyspark.ml`). 
* It uses a "splits" array to map continuous spending data into discrete buckets (0, 1, 2). 
* This is a highly efficient, scalable way to prepare features for downstream machine learning models.

### Task 5: Window-Based Percentile Ranking
By employing **Window Functions**, the script calculates a **`percent_rank`** for each customer. 
* This assigns a value between 0 and 1 representing the customer's relative standing. 
* For example, a customer with a rank of 0.95 is in the top 5% of spenders.

---

## 💡 Key Takeaways

* **Scalability:** By using Spark's distributed architecture, these segmentation tasks can be performed on millions of rows of data across a cluster.
* **Flexibility:** The project demonstrates that "value" can be defined either by **absolute metrics** (Tasks 1 & 4) or **relative metrics** (Tasks 3 & 5).
* **Model Readiness:** Task 4 specifically prepares the data for advanced predictive analytics by converting numerical spend into categorical buckets.

---

> **Note:** Ensure that the sample CSV files (`customers.csv` and `sales.csv`) are correctly placed in the `/samples/` directory before execution to avoid file-not-found errors.

Would you like to dive deeper into the specific mathematical differences between the `approxQuantile` method and the `Bucketizer` approach?