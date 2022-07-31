info ::
	@echo "make onepass pdf"
.PHONY: onepass pdf
onepass :
	TEXINPUTS=./incs:./figs:${TEXINPUTS} pdflatex TeXbyTopic
pdf :
	make bib
	make onepass
	bibtex TeXbyTopic
	make onepass
	makeindex TeXbyTopic
	make onepass
	if [ "`whoami`" = "eijkhout" ] ; then \
	  cp TeXbyTopic.pdf ${HOME}/DropBox/SciComp/TeX ; \
	fi

info ::
	@echo "make bib : copy bib file"
.PHONY: bib
bib :
	cp ${HOME}/Projects/TeX/bib/tex.bib .

info ::
	@echo "make bundle"
.PHONY: bundle
bundle :
	tar --gzip -f texbytopic.tgz -c \
	    README TeXbyTopic.pdf \
	    TeXbyTopic.tex figflow.tex glossary.tex  tables.tex tex.bib
clean :
	rm -f *.{aux,blg,brf,idx,ilg,ind,log,out,toc,svn} *~
