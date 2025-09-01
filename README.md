# Publication Template Repository

This repository provides a template for writing and compiling academic papers in either ACM or LLNCS (Springer) formats. It includes LaTeX templates, a compilation script, and organized structure for your paper's content. Have fun. 

## Setup

### Tools and Dependencies
This template relies on LaTeX for document preparation and compilation. The main tools used are:
- **pdflatex**: For compiling LaTeX documents to PDF.
- **bibtex**: For processing bibliographies.

These are part of a standard TeX distribution. No additional programming languages or tools are required beyond a basic shell environment (e.g., bash or zsh on Mac).

### Installation on Mac
1. Install a TeX distribution: The recommended one is MacTeX, which includes pdflatex, bibtex, and other necessary tools.
   - Download and install MacTeX from [tug.org/mactex](https://www.tug.org/mactex/).
   - Alternatively, if you use Homebrew, you can install a lighter version: `brew install --cask mactex` (full) or `brew install basictex` (minimal, then install additional packages as needed via `tlmgr`).
2. After installation, ensure the tools are in your PATH. You can verify by running `pdflatex --version` and `bibtex --version` in your terminal.
3. If using BasicTeX, you may need to install extra packages: `sudo tlmgr install collection-latexextra collection-bibtexextra` (run with admin privileges).
4. The compilation script (`compile_latex.sh`) is a bash script, so no additional setup is needed if you have a shell.

## Repository Structure

- **main.tex**: The main LaTeX file where you include sections and set the document class.
- **text/**: Directory for paper sections (e.g., abstract.tex, introduction.tex). Add your content here as separate TeX files.
- **images/**: Store all images and figures here. Reference them in TeX files with paths like `images/yourimage.png`.
- **out/**: Compilation outputs (PDF, logs, etc.) go here. This folder is ignored by git.
- **compile_latex.sh**: Script to compile the paper. Outputs to `out/`.
- **bibliography.bib**: Your bibliography file.
- **acmart.cls**, **acmart-tagged.cls**, etc.: ACM format files.
- **llncs.cls**, **splncs04.bst**: LLNCS format files.
- **Makefile**, **ACM-Reference-Format.bst**, etc.: Additional build and format files.
- **src/**: Optional directory for any source code or scripts related to the paper.

## How to Use

1. **Add Your Content**:
   - Edit files in `text/` for each section of your paper.
   - Update `main.tex` to include these sections (e.g., `\\input{text/introduction.tex}`).
   - Add references to `bibliography.bib`.
   - Place images in `images/` and reference them with `\\includegraphics{images/yourfile.png}`.

2. **Switching Between ACM and LLNCS Formats**:
   - In `main.tex`, change the document class:
     - For ACM: `\\documentclass[sigconf]{acmart}` (or other ACM variants).
     - For LLNCS: `\\documentclass{llncs}`.
   - Update bibliography style accordingly:
     - ACM: Use `\\bibliographystyle{ACM-Reference-Format}`.
     - LLNCS: Use `\\bibliographystyle{splncs04}`.
   - You may need to adjust packages or commands based on the format (e.g., ACM has specific metadata sections).

3. **Compilation**:
   - Run `./compile_latex.sh` from the repository root.
   - This will compile `main.tex` and output the PDF to `out/main.pdf`.
   - Check `out/main.log` for any errors or warnings.
   - If using Makefile, you can also run `make` for compilation (ensure it's configured for your format).

4. **Customization**:
   - Modify `compile_latex.sh` if you need custom compilation steps.
   - Ensure all paths in TeX files are relative to the root.

5. **Best Practices**:
   - Keep `out/` clean; it's git-ignored.
   - Test compilation after changes.
   - For large papers, consider using Overleaf if local setup is cumbersome.

If you encounter issues, ensure your TeX installation is up to date and check the log files in `out/` for details.
