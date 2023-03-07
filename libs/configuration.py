from libs import yaml
def get_pipeline_config(pipeline):
    with open(f"../pipelines/{pipeline}.yaml", "r") as configuration:
        return(yaml.safe_load(configuration))
