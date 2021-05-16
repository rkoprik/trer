# If you are new to Makefiles: https://makefiletutorial.com

PAPER := output/paper.pdf

PRESENTATION := output/presentation.pdf

TARGETS :=  $(PAPER) $(PRESENTATION)

RSCRIPT := Rscript --encoding=UTF-8

.phony: all clean very-clean dist-clean

all: $(TARGETS)

$(PAPER): doc/paper.Rmd doc/references.bib $(RESULTS)
	$(RSCRIPT) -e 'library(rmarkdown); render("doc/paper.Rmd")'
	mv doc/paper.pdf output
	rm -f doc/paper.ttt doc/paper.fff

$(PRESENTATION): doc/presentation.rmd $(RESULTS)
	$(RSCRIPT) -e 'library(rmarkdown); render("doc/presentation.Rmd")'
	mv doc/presentation.pdf output
