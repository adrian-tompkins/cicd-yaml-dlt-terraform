resource databricks_pipeline this {
  for_each = fileset("../pipelines/", "*.yaml")
  name    = trimsuffix(each.value, ".yaml")
  #storage = "/test/first-pipeline"
  configuration = {
    "pipeline.name" = trimsuffix(each.value, ".yaml")
  }
  development = true

  cluster {
    label       = "default"
    num_workers = 1
  }

  library {
    notebook {
      path = "/Repos/Adrian.Tompkins@riotinto.com/cicd-yaml-dlt-terraform/notebooks/dlt_notebook"
    }
  }

  continuous = false
}
