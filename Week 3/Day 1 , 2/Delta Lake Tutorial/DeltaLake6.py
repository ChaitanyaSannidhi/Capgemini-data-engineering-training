# Databricks notebook source
# MAGIC %md
# MAGIC

# COMMAND ----------

import dlt

# COMMAND ----------

@dlt.table(
    name = 'bronze_tbl'
)
def bronze_tbl():
    df = spark.readStream.table('deltacatalog.raw.streamsource')
    return df

# COMMAND ----------

@dlt.view
def silver_view():
    df = spark.read.table('LIVE.bronze_tbl')
    return df

# COMMAND ----------

@dlt.table

def gold_mat_view():
    df = spark.read.table('LIVE.silver_view')
    return df

# COMMAND ----------

