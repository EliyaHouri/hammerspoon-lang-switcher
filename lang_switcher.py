#!/usr/bin/env python3
import sys
import json

with open('lang_config.json') as f:
    lang_map = json.load(f)

app_name = sys.argv[1]

for lang, apps in lang_map.items():
    if app_name in apps:
        print(lang)
        sys.exit(0)

sys.exit(1)
