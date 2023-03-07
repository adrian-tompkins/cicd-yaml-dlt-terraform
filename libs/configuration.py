from libs import yaml
def get_pipeline_config(pipeline):
    with open(f"/Workspace/Repos/Adrian.Tompkins@riotinto.com/cicd-yaml-dlt-terraform/pipelines/{pipeline}.yaml", "r") as configuration:
        return(yaml.safe_load(configuration))
