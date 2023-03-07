from libs import yaml
def get_pipeline_config(yaml_config_path):
    with open(yaml_config_path, "r") as configuration:
        return(yaml.safe_load(configuration))
