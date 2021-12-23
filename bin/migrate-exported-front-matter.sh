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

parse_author_from_title() {
    # title: How Do I Remember Thee? – by Dion D’Souza
    local file_name
    while read file_name
    do sed -i -E \
           -e 's;^(title\:.*\s+–\s+(by)?)\s+(.*);\0\nauthor: "\3";' \
           -e '/^author\: TBLM/d' \
           "$(realpath ../content/posts/${file_name})"
    done
}

remove_author_from_title() {
    # title: How Do I Remember Thee? – by Dion D’Souza
    # to
    # title: How Do I Remember Thee?
    # Also, remove spurious single quotes that carried over into author
    # names when we parsed out author from title.
    local file_name
    while read file_name
    do sed -i -E \
           -e "s;^(title\:\s+)('?)(.*)(\s+–\s+(by)?.*);\1'\3';" \
           -e "s;^(author\:.*)('\");\1\";" \
           "$(realpath ../content/posts/${file_name})"
    done
}

make_all_issues_numeric() {
    local file_name
    while read file_name
    do sed -i -E \
           -e 's;(issue:\s+)(A)(.*);\11\3;' \
           -e 's;(issue:\s+)(B)(.*);\12\3;' \
           -e 's;(issue:\s+)(C)(.*);\13\3;' \
           -e 's;(issue:\s+)(D)(.*);\14\3;' \
           -e 's;(issue:\s+)(E)(.*);\15\3;' \
           "$(realpath ../content/posts/${file_name})"
    done
}

remove_explicit_slug() {
    local file_name
    while read file_name
    do sed -i -E -e '/^slug:.*/d' \
           "$(realpath ../content/posts/${file_name})"
    done
}

# copy_posts

# ls -1 ../content/posts/ | massage_date
# ls -1 ../content/posts/ | massage_issue_id
# ls -1 ../content/posts/ | add_newline_to_eofs
# ls -1 ../content/posts/ | massage_category
# ls -1 ../content/posts/ | slugify_url
# ls -1 ../content/posts/ | parse_author_from_title
# ls -1 ../content/posts/ | remove_author_from_title
# ls -1 ../content/posts/ | make_all_issues_numeric
ls -1 ../content/posts/ | remove_explicit_slug
