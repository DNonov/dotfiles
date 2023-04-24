import json, os, glob

settings_files_path = os.path.abspath("./code/settings")

def get_settings_files():
    return glob.glob(f"{settings_files_path}/**/*.json", recursive=True)

def create_settings_file(file_path):
    accumulator_dict = dict()
    settings_files = get_settings_files()

    for file in settings_files:
        try:
            with open(file, 'r') as file_content:
                accumulator_dict.update(json.load(file_content))
        except IOError:
            print(f"{file} cannot be merged!")

    with open(file_path, 'w') as final_file:
        json.dump(accumulator_dict, final_file)

create_settings_file('./code/settings.json')
