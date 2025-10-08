#!/bin/bash

# Generate year archive pages based on directory structure

YEARS_DIR="content/years"
mkdir -p "$YEARS_DIR"

# Extract unique years from directory structure
years=$(ls -d content/post/blogs/20*/ 2>/dev/null | sed 's|content/post/blogs/||;s|/||' | cut -d'/' -f1 | sort -u)

if [ -z "$years" ]; then
    echo "No years found in directory structure"
    exit 1
fi

echo "Found years: $years"

for year in $years; do
    year_file="$YEARS_DIR/$year.md"

    if [ ! -f "$year_file" ]; then
        cat > "$year_file" <<EOF
---
title: "$year"
type: years
layout: single
---
EOF
        echo "Created $year_file"
    else
        echo "$year_file already exists, skipping"
    fi
done

echo "Year pages generation complete!"
