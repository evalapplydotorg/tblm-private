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

massage_issue_id() {
    local file_name
    while read file_name
    do sed -i -E \
           "s;^\s+\-\s+(Issue)\s+([[:alnum:]]?[[:digit:]])\s+(\(.*\));issue: \2;" \
           "$(realpath ../content/posts/${file_name})"
    done
}

add_newline_to_eofs() {
    local file_name
    local finame
    while read file_name
    do printf "\n" >> "$(realpath ../content/posts/${file_name})"
    done
}

massage_category() {
    local file_name
    while read file_name
    do sed -i \
           -E '{N; s/^categories\:\s+\-\s+[[:digit:]]\.\s+(\w+)$/category\: \L\1/ ; P ;  D}' \
           "$(realpath ../content/posts/${file_name})"
       sed -i \
           -E '{N; s/^(category\:\s+(\w+))(\s+\-\s+\"Issue\s+[[:alnum:]]+\s+.*)/\1/ ; P ; D}' \
           "$(realpath ../content/posts/${file_name})"
       sed -i \
           -E '{N; s/^(category\:\s+(\w+))(\s+\-\s+[[:alnum:]]+\.\s+Reviews*)/category\: reviews/ ; P ; D}' \
           "$(realpath ../content/posts/${file_name})"
    done
}

slugify_url() {
    local file_name
    while read file_name
    do sed -i -E "s;^(url\:\s+/)(.*);slug\: '\2';" \
           "$(realpath ../content/posts/${file_name})"
    done
}

# copy_posts

# ls -1 ../content/posts/ | massage_date
# ls -1 ../content/posts/ | massage_issue_id
# ls -1 ../content/posts/ | add_newline_to_eofs
# ls -1 ../content/posts/ | massage_category
ls -1 ../content/posts/ | slugify_url
