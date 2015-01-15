ALL_FIGURE_NAMES=$(shell cat pacchettocrop.figlist)
ALL_FIGURES=$(ALL_FIGURE_NAMES:%=%.pdf)

allimages: $(ALL_FIGURES)
	@echo All images exist now. Use make -B to re-generate them.

FORCEREMAKE:

include $(ALL_FIGURE_NAMES:%=%.dep)

%.dep:
	mkdir -p $(dir $@)
	touch $@ # will be filled later.

figures/myfigurename.pdf: FORCEREMAKE
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/myfigurename" "\def\tikzexternalrealjob{pacchettocrop}\input{pacchettocrop}"

figures/myfigurename.pdf: figures/myfigurename.md5
