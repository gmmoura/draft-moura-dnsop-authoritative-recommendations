
.PHONY: all pdf FORCE_MAKE

all pdf:: presentation.pdf

%.pdf: %.tex FORCE_MAKE
	latexmk -pdf $<

clean::
	latexmk -c

tech_report.pdf: presentation.tex


