import subprocess, os

extensions_list_file_path = os.path.abspath("./code/extensions_list.txt")

with open(extensions_list_file_path, "w") as extensions_file:
    subprocess.run(["code", "--list-extensions"], stdout=extensions_file)
