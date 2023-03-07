resource databricks_pipeline this {
  for_each = fileset("../pipelines/", "*.yaml")
  name    = trim(each.value, ".yaml")
  #storage = "/test/first-pipeline"
  configuration = {
    pipeline_configuration = "pipelines/${each.value}"
  }

  cluster {
    label       = "default"
    num_workers = 1
  }

  library {
    notebook {
      path = "/Repos/test"
    }
  }

  continuous = false
}
