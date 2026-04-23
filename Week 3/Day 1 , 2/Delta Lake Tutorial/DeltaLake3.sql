-- Databricks notebook source
-- MAGIC %md
-- MAGIC ### DML With Delta Tables

-- COMMAND ----------

Create table deltacatalog.raw.ext_my_table_dml_dvd
(
  id int ,
  order_name string,
  amount double,
  product_id int
)
Using Delta
Location 'abfss://raw@chaitudeltalake.dfs.core.windows.net/ext_my_table_dml_dvd'

-- COMMAND ----------

insert into deltacatalog.raw.ext_my_table_dml_dvd values
  (1,'bisccuits' , 10 , 101),
  (2,'cookies' , 20 , 102),
  (3,'chips' , 30 , 103)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### NOt turning off the Deletion Vectors

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Update in Delta Tables

-- COMMAND ----------

Update deltacatalog.raw.ext_my_table_dml_dvd set amount = 100 where id = 1

-- COMMAND ----------

Select * from deltacatalog.raw.ext_my_table_dml

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Delete Data

-- COMMAND ----------

Delete from deltacatalog.raw.ext_my_table_dml where id = 1

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Time Travel and Versioning

-- COMMAND ----------

Select * from deltacatalog.raw.ext_my_table_dml

-- COMMAND ----------

describe history deltacatalog.raw.ext_my_table_dml

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Getting Back to a Pipeline

-- COMMAND ----------

Restore deltacatalog.raw.ext_my_table_dml to version as of 3

-- COMMAND ----------

Select * from deltacatalog.raw.ext_my_table_dml

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Vaccum

-- COMMAND ----------

SET spark.databricks.delta.retentionDurationCheck.enabled = false;
VACUUM deltacatalog.raw.ext_my_table_dml retain 0 hours dry run

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Optimize and ZORDERBY 

-- COMMAND ----------

Optimize deltacatalog.raw.ext_my_table_dml zorder by id

-- COMMAND ----------

create table deltacatalog.raw.liq_my_table(
  id int,
  amount double,
  name string
)
Using Delta 
Location 'abfss://raw@chaitudeltalake.dfs.core.windows.net/liq_my_table'
Cluster by (id)

-- COMMAND ----------

