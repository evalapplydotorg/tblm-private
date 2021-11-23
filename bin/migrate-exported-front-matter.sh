#!/usr/bin/env bash

copy_posts() {
    cp -n ../../hugo-export/posts/*.md ../content/posts/
}

massage_date() {
    local file_name
    while read file_name
    do sed -i -E \
           's;(date\:)\s+([[:digit:]]+)\-([[:digit:]]+).*;\0\nyear: "\2"\nmonth: "\2/\3";' \
           "$(realpath ../content/posts/${file_name})"
    done
}

copy_posts

ls -1 ../content/posts/ | massage_date
