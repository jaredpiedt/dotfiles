#!/bin/bash

# Load .bashrc and other files...
for file in ~/.{bashrc,bash_prompt,aliases,path,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file