resource databricks_pipeline this {
  for_each = fileset("../pipelines/", "*.yaml")
  name    = trimsuffix(each.value, ".yaml")
  #storage = "/test/first-pipeline"
  configuration = {
    pipeline_configuration = "pipelines/${each.value}"
  }
  development = true

  cluster {
    label       = "default"
    num_workers = 1
    #dbfs:/FileStore/jars/d7d151c3_2fa6_4aee_bbd2_254e2a583bb4/PyYAML-6.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
  }

  library {
    notebook {
      path = "/Repos/Adrian.Tompkins@riotinto.com/cicd-yaml-dlt-terraform/notebooks/dlt_notebook"
    }
  }

  continuous = false
}
