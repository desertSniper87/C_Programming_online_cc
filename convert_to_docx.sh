#!/bin/bash

# Script to convert curriculum.md to docx using pandoc

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "Error: pandoc is not installed. Please install it first."
    echo "You can install it using:"
    echo "  - macOS: brew install pandoc"
    echo "  - Linux: sudo apt-get install pandoc"
    echo "  - Windows: Download from https://pandoc.org/installing.html"
    exit 1
fi

# Define input and output files
INPUT_FILE="curriculum.md"
OUTPUT_FILE="curriculum.docx"

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found."
    exit 1
fi

# Convert markdown to docx
echo "Converting $INPUT_FILE to $OUTPUT_FILE..."
pandoc "$INPUT_FILE" \
    -f markdown \
    -t docx \
    -o "$OUTPUT_FILE" \
    --standalone \
    --reference-doc="" \
    --toc \
    --toc-depth=2

# Check if conversion was successful
if [ -f "$OUTPUT_FILE" ]; then
    echo "Conversion successful! Output file: $OUTPUT_FILE"
else
    echo "Error: Conversion failed."
    exit 1
fi