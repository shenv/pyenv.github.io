#!/bin/bash

cd shells

previous_name=""
sha256sum *.* | while read -r line; do
  file="${line##* }"
  sha="${line%% *}"

  name="${file}"
  while [[ ! "${name##*.}" =~ [0-9]+ ]]; do
    name="${name%.*}"
  done
  name="${name^}"
  name="${name//-/ }"

  if [ "${name}" = "${previous_name}" ]; then
    echo "  <li><a href=\"${sha}\">${file}</a></li>"
  else
    if [ -n "${previous_name}" ]; then
      echo "</ul>"
      echo
    fi
    echo "<h3>${name}</h3>"
    echo "<ul>"
    echo "  <li><a href=\"shells/${sha}\">${file}</a></li>"
  fi

  previous_name="${name}"
done
echo "</ul>"
