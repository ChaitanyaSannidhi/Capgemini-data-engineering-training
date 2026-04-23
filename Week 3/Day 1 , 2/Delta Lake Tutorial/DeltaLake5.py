# Databricks notebook source
# MAGIC %md
# MAGIC ### Source Delta Table

# COMMAND ----------

# MAGIC %sql
# MAGIC Create table deltacatalog.raw.streamsource
# MAGIC (
# MAGIC   id int ,
# MAGIC   order_name string,
# MAGIC   amount double,
# MAGIC   product_id int
# MAGIC )
# MAGIC Using Delta
# MAGIC Location 'abfss://raw@chaitudeltalake.dfs.core.windows.net/streamsource'

# COMMAND ----------

# MAGIC %sql
# MAGIC insert into deltacatalog.raw.streamsource values
# MAGIC   (1,'bisccuits' , 10 , 101),
# MAGIC   (2,'cookies' , 20 , 102),
# MAGIC   (3,'chips' , 30 , 103)

# COMMAND ----------

# MAGIC %md
# MAGIC ### Streaming Query

# COMMAND ----------

df = spark.readStream.table('deltacatalog.raw.streamsource')

# COMMAND ----------

df.writeStream.format("delta")\
  .option("checkpointLocation", "abfss://raw@chaitudeltalake.dfs.core.windows.net/streamsink/checkpoint")\
  .trigger(processingTime = '10 Seconds')\
  .start("abfss://raw@chaitudeltalake.dfs.core.windows.net/streamsink/data")

# COMMAND ----------

# MAGIC %sql
# MAGIC Select * from delta.`abfss://raw@chaitudeltalake.dfs.core.windows.net/streamsink/data`

# COMMAND ----------

# MAGIC %sql
# MAGIC insert into deltacatalog.raw.streamsource values
# MAGIC   (4,'bisccuits' , 40 , 101),
# MAGIC   (5,'cookies' , 60 , 102),
# MAGIC   (6,'chips' , 10 , 103)

# COMMAND ----------

