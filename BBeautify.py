#!/usr/bin/env python3
"""
BBEdit Text Filter: BBeautify
Beautifies minified JavaScript or CSS piped in from BBEdit.
Replaces selected text, or the entire file if nothing is selected.
"""

import sys
import os
import jsbeautifier
import cssbeautifier

""" read from stdin and strip """
content = sys.stdin.read()
language = os.environ.get("BB_DOC_LANGUAGE", "")

""" check for css or js """
if language == "CSS":
    print(cssbeautifier.beautify(content), end="")
elif language in ("JavaScript", "JSON"):
    print(jsbeautifier.beautify(content), end="")
# else: unsupported language, pass through nothing (BBEdit will leave selection unchanged)
