# makefile for document

%.pdf: %.tex
	pdflatex -shell-escape $<

.PHONY: document 
document: document.tex
	pdflatex -shell-escape $<

.PHONY: bib 
bib: document.tex document.aux refs.bib
	pdflatex -shell-escape $<
	bibtex document.aux
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<
