resource databricks_pipeline this {
  for_each = fileset("../pipelines/", "*.yaml")
  name    = trimsuffix(each.value, ".yaml")
  depends_on = [databricks_repo.this]
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

resource databricks_repo this {
  url = "https://github.com/adrian-tompkins/cicd-yaml-dlt-terraform.git"
  path = "/Repos/prod/cicd-yaml-dlt-terraform"
}
