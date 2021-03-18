#!/bin/sh

TEMPLATE_DIR="${INPUT_INPUT_DIR:-input}"
OUTPUT_BASE_DIR="${INPUT_OUTPUT_DIR:-output}"

list_files() {
  for file in "$1"/*; do
    if [ -d "$file" ]; then
      # Go into sub directory
      list_files "$file"
    else
      SUB_DIR="${1/${TEMPLATE_DIR}/$empty}"
      OUTPUT_DIR="${OUTPUT_BASE_DIR}${SUB_DIR}/"
      mkdir -p "$OUTPUT_DIR"
      fileext=${file##*.}
      if [[ "$fileext" == "mjml" ]]; then
        echo "Compile ${file}"
        mjml -r "${file}" -o "${OUTPUT_DIR}"
      else
        echo "Copy ${file}"
        cp -r "${file}" "${OUTPUT_DIR}"
      fi
    fi
  done
}

list_files "$TEMPLATE_DIR"
