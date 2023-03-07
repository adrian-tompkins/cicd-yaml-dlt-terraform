# Databricks notebook source
import dlt
from libs import configuration

pipeline_config = configuration.get_pipeline_config(spark.conf.get('pipeline.yaml_config_path'))
for table, config in pipeline_config.items():
    @dlt.table(
        name=table,
        comment=config["comment"]
    )
    def create_bronze_table():
        values = [[value] for value in config["values"]]
        return spark.createDataFrame(values, ["value"])