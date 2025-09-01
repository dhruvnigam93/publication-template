#!/bin/bash

# Change to the latex directory
cd "$(dirname "$0")"

echo "Starting LaTeX compilation routine..."

# Run pdflatex first time
echo "Running pdflatex first pass..."
pdflatex -output-directory=out -synctex=1 -interaction=nonstopmode -file-line-error main.tex

# Run bibtex
echo "Running bibtex..."
bibtex out/main

# Run pdflatex second time
echo "Running pdflatex second pass..."
pdflatex -output-directory=out -synctex=1 -interaction=nonstopmode -file-line-error main.tex

# Run pdflatex third time to resolve all cross-references
echo "Running pdflatex final pass..."
pdflatex -output-directory=out -synctex=1 -interaction=nonstopmode -file-line-error main.tex

echo "Compilation complete!"

# Check if there were any errors or warnings in the log file
if grep -i "warning" out/main.log > /dev/null || grep -i "error" out/main.log > /dev/null; then
    echo "Note: There were warnings or errors during compilation. Check main.log for details."
fi