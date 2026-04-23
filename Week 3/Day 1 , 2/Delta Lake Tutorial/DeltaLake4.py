# Databricks notebook source
# MAGIC %md
# MAGIC ### Schema Evaluation

# COMMAND ----------

# MAGIC %md
# MAGIC #### Merge Schema

# COMMAND ----------

my_data = [(1,'food',10),(2,'drink',20),(3,'food',30),(4,'drink',40)]
my_schema = "id INT, category STRING, price INT"
df = spark.createDataFrame(my_data, my_schema)

# COMMAND ----------

df_new = df.union(spark.createDataFrame([(5,'food',50),(6,'drink',60)],my_schema))

# COMMAND ----------

df_new.display()

# COMMAND ----------

df_new.write.format("delta")\
    .mode('append')\
    .option('mergeSchema','true')\
    .option('path','abfss://raw@chaitudeltalake.dfs.core.windows.net/schematable')\
    .save()

# COMMAND ----------

from pyspark.sql.functions import *
df_new = df_new.withColumn(("flag"),lit(1))

# COMMAND ----------

df_new.display()

# COMMAND ----------

df = spark.read.format("delta").load("abfss://raw@chaitudeltalake.dfs.core.windows.net/schematable")
df.display()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Explicit Schema Updates
# MAGIC

# COMMAND ----------

# MAGIC %md
# MAGIC ADD A COLUMN

# COMMAND ----------

# MAGIC %sql
# MAGIC Alter table deltacatalog.raw.ext_my_table_dml
# MAGIC Add column flag string

# COMMAND ----------

# MAGIC %sql
# MAGIC Select * from deltacatalog.raw.ext_my_table_dml

# COMMAND ----------

# MAGIC %md
# MAGIC ADD A COLUMN AFTER

# COMMAND ----------

# MAGIC %sql
# MAGIC Alter table deltacatalog.raw.ext_my_table_dml
# MAGIC Add column newcol string after id

# COMMAND ----------

# MAGIC %sql
# MAGIC Select * from deltacatalog.raw.ext_my_table_dml

# COMMAND ----------

# MAGIC %md
# MAGIC REORDERING COLUMNS

# COMMAND ----------

# MAGIC %sql
# MAGIC Alter table deltacatalog.raw.ext_my_table_dml
# MAGIC Alter column newcol after flag

# COMMAND ----------

# MAGIC %sql
# MAGIC Select * from deltacatalog.raw.ext_my_table_dml

# COMMAND ----------

# MAGIC %md
# MAGIC RENAME COLUMNS

# COMMAND ----------

# MAGIC %sql
# MAGIC     
# MAGIC ALTER TABLE deltacatalog.raw.ext_my_table_dml SET TBLPROPERTIES (
# MAGIC    'delta.columnMapping.mode' = 'name',
# MAGIC    'delta.minReaderVersion' = '2',
# MAGIC    'delta.minWriterVersion' = '5');
# MAGIC
# MAGIC Alter table deltacatalog.raw.ext_my_table_dml
# MAGIC rename column newcol to newflag

# COMMAND ----------

# MAGIC %sql
# MAGIC Select * from deltacatalog.raw.ext_my_table_dml

# COMMAND ----------

# MAGIC %sql
# MAGIC reorg table deltacatalog.raw.ext_my_table_dml apply (purge)

# COMMAND ----------

