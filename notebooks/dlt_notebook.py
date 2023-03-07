# Databricks notebook source
%pip install yaml

# COMMAND ----------
import dlt
from libs import configuration

pipeline_config = configuration.get_tables(spark.conf.get('pipeline.name'))
for table, config in pipeline_config.items():
    @dlt.table(
        name=table,
        comment=config["comment"]
    )
    def create_bronze_table():
        values = [[value] for value in config["values"]]
        return spark.createDataFrame(values, ["value"])


    configuration.get_pipeline_config("my_dlt_pipeline")
    print(table)
    print(config["comment"])
    print(config["keys"])