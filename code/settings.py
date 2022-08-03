import json

settings_files = [
    "./code/general/editor.json",
    "./code/general/workbench.json",
    "./code/languages/python.json",
    "./code/languages/csharp.json",
    "./code/languages/git.json",
    "./code/languages/html.json",
    "./code/languages/javascript.json",
    "./code/extensions/emmet.json",
    "./code/extensions/gitlens.json",
    "./code/extensions/polacode.json",
    "./code/extensions/simpleIcons.json",
    "./code/extensions/cspell.json",
    "./code/extensions/vim.json",
    "./code/extensions/eslint.json",
    "./code/extensions/customCss.json",
    "./code/general/associations.json",
]

def create_settings_file(file_path):
    accumulator_dict = dict()
    for file in settings_files:
        try:
            with open(file, 'r') as file_content:
                accumulator_dict.update(json.load(file_content))
        except IOError:
            print(f"{file} cannot be merged!")

    with open(file_path, 'w') as final_file:
        json.dump(accumulator_dict, final_file)


create_settings_file('./code/settings.json')