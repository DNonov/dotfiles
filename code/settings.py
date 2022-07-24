import json

SETTINGS_FILES = [
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

def create_settings_file(file):
    result = dict()
    for f in SETTINGS_FILES:
        with open(f, 'r') as in_file:
            result.update(json.load(in_file))

    with open(file, 'w') as final_file:
        json.dump(result, final_file)


create_settings_file('./code/settings.json')