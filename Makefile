################################################################
####
#### This file belongs with the repository of "TeX by Topic"
#### copyright Victor Eijkhout 1991-2023,
#### released under the GNU Free Documentation License
####
################################################################

info ::
	@echo "make onepass pdf"
.PHONY: onepass pdf
onepass :
	TEXINPUTS=./incs:./figs:${TEXINPUTS} pdflatex TeXbyTopic
pdf : bib
	make bib
	make onepass
	bibtex TeXbyTopic
	make onepass
	makeindex TeXbyTopic
	make onepass
	if [ "`whoami`" = "eijkhout" ] ; then \
	  cp TeXbyTopic.pdf ${HOME}/DropBox/SciComp/TeX ; \
	fi

.PHONY: clean
info ::
	@echo "make clean : remove formatting byproducts"
clean :
	rm -f *.{aux,blg,brf,idx,ilg,ind,log,out,toc,svn} *~

##
## rules just for the the maintainer of this repo
##
info ::
	@if [ "$$( whoami )" = "eijkhout" ] ; then \
	    echo "make bib : copy bib file" \
	     && echo "make bundle" \
	 ; fi
.PHONY: bib bundle
bib :
	@if [ "$$( whoami )" = "eijkhout" ] ; then \
	    cp ${HOME}/Projects/TeX/bib/tex.bib . \
	; fi
bundle :
	@if [ "$$( whoami )" = "eijkhout" ] ; then \
	  tar --gzip -f texbytopic.tgz -c \
	    README TeXbyTopic.pdf \
	    TeXbyTopic.tex figflow.tex glossary.tex  tables.tex tex.bib \
	 ; fi
