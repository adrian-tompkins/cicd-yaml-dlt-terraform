# Databricks notebook source
import dlt
from libs import configuration


# COMMAND ----------

for table_config in configuration.get_tables(spark.conf.get('pipeline.name')):
    pass
