# makefile for document

.PHONY: document 
document: document.tex
	pdflatex -shell-escape $<

%.pdf: %.tex
	pdflatex -shell-escape $<

.PHONY: bib 
bib: document.tex document.aux refs.bib
	pdflatex -shell-escape $<
	bibtex document.aux
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<

.PHONY: clean
clean:	
	rm *.nlo *.aux *.log *.out *.bbl *.blg 
