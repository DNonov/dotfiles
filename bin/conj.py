#! /usr/bin/env python3.8

from urllib.request import urlopen
import sys
from bs4 import BeautifulSoup

if len(sys.argv) > 1:
    verb_to_check = sys.argv[1] + ".html"

    URL = "http://conjugator.reverso.net/conjugation-english-verb-"
    URL += verb_to_check

    page = urlopen(URL)
    soup = BeautifulSoup(page, "html.parser")

    pronouns = soup.find_all("i", attrs={"class": "graytxt"})[0:12]
    verbs = soup.find_all("i", attrs={"class": "verbtxt"})[0:12]

    if verbs:
        for pronoun, verb in zip(pronouns, verbs):
            stripped_pronoun = pronoun.text.strip()
            stripped_verb = verb.text.strip()
            print(stripped_pronoun + " " + stripped_verb)
    else:
        print("There is no such a verb.")
else:
    print("Missing argument.")
