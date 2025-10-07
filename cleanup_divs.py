#!/usr/bin/env python3
"""
Clean up unnecessary <div> tags in markdown files.
Converts patterns like:
- <div>AAA</div>\n<div>BBB</div> -> AAA<br>\nBBB
- <div>AAA</div>\n<div></div>\n<div>BBB</div> -> AAA\n\nBBB
"""

import re
import sys
from pathlib import Path


def clean_div_tags(content):
    """Clean up div tags from markdown content."""
    # Remove front matter temporarily
    front_matter = ""
    body = content

    if content.startswith("---"):
        parts = content.split("---", 2)
        if len(parts) >= 3:
            front_matter = f"---{parts[1]}---"
            body = parts[2]

    # Remove leading/trailing whitespace from body for processing
    body = body.lstrip()

    # Step 1: Clean up nested empty divs like <div>\n  <div>\n  </div>\n</div>
    body = re.sub(r'<div>\s*<div>\s*</div>\s*</div>', '', body, flags=re.MULTILINE)

    # Step 2: Remove standalone empty divs
    body = re.sub(r'<div>\s*</div>\s*\n?', '', body, flags=re.MULTILINE)

    # Step 3: Extract content from divs and handle spacing
    lines = body.split('\n')
    result_lines = []
    i = 0

    while i < len(lines):
        line = lines[i]

        # Check if line starts with <div>
        div_match = re.match(r'^<div>\s*$', line.strip())
        if div_match:
            # Found opening div, collect content until closing div
            content_lines = []
            i += 1

            while i < len(lines):
                if re.match(r'^\s*</div>\s*$', lines[i].strip()):
                    # Found closing div
                    div_content = '\n'.join(content_lines).strip()

                    # Check if next line is also a div
                    next_i = i + 1

                    # Skip empty lines after this div
                    empty_count = 0
                    while next_i < len(lines) and lines[next_i].strip() == '':
                        empty_count += 1
                        next_i += 1

                    # Check if next non-empty line is a div
                    has_next_div = False
                    if next_i < len(lines):
                        next_line = lines[next_i].strip()
                        has_next_div = next_line.startswith('<div>')

                    if div_content:
                        result_lines.append(div_content)

                        if has_next_div:
                            # If there's a following div
                            if empty_count > 0:
                                # Empty divs between = paragraph break
                                result_lines.append('')
                            else:
                                # No empty divs = line break
                                result_lines[-1] += '<br>'

                    i = next_i - 1
                    break
                else:
                    content_lines.append(lines[i])
                    i += 1
        else:
            # Regular line, just add it
            if line.strip() or (result_lines and result_lines[-1].strip()):
                result_lines.append(line)

        i += 1

    # Join result and clean up excessive blank lines
    body = '\n'.join(result_lines)

    # Remove more than 2 consecutive blank lines
    body = re.sub(r'\n{3,}', '\n\n', body)

    # Combine front matter and body
    if front_matter:
        return front_matter + '\n' + body.strip() + '\n'
    else:
        return body.strip() + '\n'


def process_file(file_path):
    """Process a single markdown file."""
    print(f"Processing: {file_path}")

    with open(file_path, 'r', encoding='utf-8') as f:
        original_content = f.read()

    cleaned_content = clean_div_tags(original_content)

    if cleaned_content != original_content:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(cleaned_content)
        print(f"  ✓ Updated")
        return True
    else:
        print(f"  - No changes needed")
        return False


def main():
    if len(sys.argv) < 2:
        print("Usage: python cleanup_divs.py <file1> [file2] ...")
        sys.exit(1)

    files = [Path(f) for f in sys.argv[1:]]
    updated_count = 0

    for file_path in files:
        if file_path.exists():
            if process_file(file_path):
                updated_count += 1
        else:
            print(f"Warning: {file_path} does not exist")

    print(f"\n✓ Processed {len(files)} files, updated {updated_count}")


if __name__ == '__main__':
    main()
