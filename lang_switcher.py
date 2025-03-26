#!/usr/bin/env python3
import sys
import json
import unicodedata
import logging
import os

# Explicitly set up logging to a known file
logging.basicConfig(
    filename=os.path.expanduser("~/.hammerspoon/lang_switcher.log"),
    level=logging.DEBUG,
    format="%(asctime)s %(levelname)s: %(message)s"
)

try:
    with open(os.path.expanduser('~/.hammerspoon/lang_config.json')) as f:
        lang_map = json.load(f)

    raw_app_name = sys.argv[1]
    logging.debug(f"Raw app name: '{raw_app_name}'")

    app_name = unicodedata.normalize('NFKD', raw_app_name).strip()
    app_name = app_name.replace('\u200f', '').replace('\u200e', '')
    logging.debug(f"Normalized app name: '{app_name}'")

    for lang, apps in lang_map.items():
        if app_name in apps:
            logging.debug(f"App '{app_name}' matched language '{lang}'")
            print(lang)
            sys.exit(0)

    logging.debug(f"No match found for app '{app_name}'")
    sys.exit(1)

except Exception as e:
    logging.exception(f"Script exception: {e}")
    sys.exit(1)
