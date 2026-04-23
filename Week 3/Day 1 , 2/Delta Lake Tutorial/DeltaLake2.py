# Databricks notebook source
# MAGIC %md
# MAGIC ### DML With Delta Tables

# COMMAND ----------

# MAGIC %sql
# MAGIC Create table deltacatalog.raw.ext_my_table_dml
# MAGIC (
# MAGIC   id int ,
# MAGIC   order_name string,
# MAGIC   amount double,
# MAGIC   product_id int
# MAGIC )
# MAGIC Using Delta
# MAGIC Location 'abfss://raw@chaitudeltalake.dfs.core.windows.net/ext_my_table_dml'

# COMMAND ----------

# MAGIC %sql
# MAGIC insert into deltacatalog.raw.ext_my_table_dml values
# MAGIC   (1,'bisccuits' , 10 , 101),
# MAGIC   (2,'cookies' , 20 , 102),
# MAGIC   (3,'chips' , 30 , 103)

# COMMAND ----------

# MAGIC %md
# MAGIC ### Turning off the Deletion Vectors

# COMMAND ----------

# MAGIC %sql
# MAGIC ALTER TABLE deltacatalog.raw.ext_my_table_dml SET TBLPROPERTIES('delta.enableDeletionVectors' = false);

# COMMAND ----------

# MAGIC %md
# MAGIC ### Update in Delta Tables

# COMMAND ----------

# MAGIC %sql
# MAGIC Update deltacatalog.raw.ext_my_table_dml set amount = 100 where id = 1

# COMMAND ----------

# MAGIC %sql
# MAGIC Select * from deltacatalog.raw.ext_my_table_dml

# COMMAND ----------

# MAGIC %md
# MAGIC ### Delete Data

# COMMAND ----------

# MAGIC %sql
# MAGIC Delete from deltacatalog.raw.ext_my_table_dml where id = 1