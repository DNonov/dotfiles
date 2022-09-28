import os, subprocess

path = os.path.abspath("code/extensions_list.txt")

with open(path, "r") as extensions_list:
    for extension in extensions_list.read().split("\n"):
        subprocess.run(["code", "--install-extension", extension])