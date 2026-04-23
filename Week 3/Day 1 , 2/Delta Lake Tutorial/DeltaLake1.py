# Databricks notebook source
# MAGIC %md
# MAGIC ### Create Schema
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC Create Schema deltacatalog.raw

# COMMAND ----------

# MAGIC %md
# MAGIC ### Creating a Delta Table (Managed)
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC Create table deltacatalog.raw.managed_my_table
# MAGIC (
# MAGIC   id int ,
# MAGIC   order_name string,
# MAGIC   amount double,
# MAGIC   product_id int
# MAGIC )
# MAGIC Using Delta

# COMMAND ----------

# MAGIC %sql
# MAGIC insert into deltacatalog.raw.managed_my_table values
# MAGIC   (1,'bisccuits' , 10 , 101),
# MAGIC   (2,'cookies' , 20 , 102),
# MAGIC   (3,'chips' , 30 , 103)

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from deltacatalog.raw.managed_my_table

# COMMAND ----------

# MAGIC %md
# MAGIC ### Create a Delta Table (External)

# COMMAND ----------

# MAGIC %sql
# MAGIC Create table deltacatalog.raw.ext_my_table
# MAGIC (
# MAGIC   id int ,
# MAGIC   order_name string,
# MAGIC   amount double,
# MAGIC   product_id int
# MAGIC )
# MAGIC Using Delta
# MAGIC Location 'abfss://raw@chaitudeltalake.dfs.core.windows.net/ext_my_table'

# COMMAND ----------

# MAGIC %sql
# MAGIC insert into deltacatalog.raw.ext_my_table values
# MAGIC   (1,'bisccuits' , 10 , 101),
# MAGIC   (2,'cookies' , 20 , 102),
# MAGIC   (3,'chips' , 30 , 103)

# COMMAND ----------

# MAGIC %sql
# MAGIC Select * from delta.`abfss://raw@chaitudeltalake.dfs.core.windows.net/ext_my_table`

# COMMAND ----------

# MAGIC %md
# MAGIC ### CETAS
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC CREATE TABLE deltacatalog.raw.ext_my_table_cetas
# MAGIC USING delta
# MAGIC location 'abfss://raw@chaitudeltalake.dfs.core.windows.net/ext_my_table_cetas' 
# MAGIC  as 
# MAGIC  select * from deltacatalog.raw.managed_my_table

# COMMAND ----------

# MAGIC %md
# MAGIC ### Cloning in DataLake
# MAGIC

# COMMAND ----------

# MAGIC %md
# MAGIC ### Deep Clone

# COMMAND ----------

# MAGIC %sql
# MAGIC create table deltacatalog.raw.ext_my_table_deep
# MAGIC deep clone deltacatalog.raw.ext_my_table
# MAGIC

# COMMAND ----------

# MAGIC %md
# MAGIC ### Shallow Copy
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC create table deltacatalog.raw.managed_my_table_shallow
# MAGIC shallow clone deltacatalog.raw.managed_my_table
# MAGIC

# COMMAND ----------

