#!/bin/bash

html=$(./echo-html-list.sh)

updated_contents="$({
  sed -e '/<!-- begin list -->/,$d' index.html
  echo '<!-- begin list -->'
  echo "${html}"
  sed -ne '/<!-- end list -->/,$p' index.html
})"

echo "${updated_contents}" > index.html
