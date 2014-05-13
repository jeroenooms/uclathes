#!/bin/bash
#we need to do this for chapterbib
#see http://stackoverflow.com/questions/2765209/latex-bibliography-per-chapter
R -e 'library(knitr); knit("thesis.Rnw")'
pdflatex thesis.tex
for auxfile in chap*.aux
do
    bibtex `basename $auxfile .aux`
done
pdflatex thesis.tex
pdflatex thesis.tex
