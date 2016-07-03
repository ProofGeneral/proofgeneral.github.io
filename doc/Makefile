### Makefile to automate the generation of PG's doc for github.io
### Erik Martin-Dorel, 2016

### First attempt (Download a tarball from GitHub and unpack it)
# URL=https://github.com/ProofGeneral/PG/archive/master.tar.gz
# TAR_DIR=PG-master/doc
# DIR=_src
# TAR=$(DIR)/PG-master.tar.gz
# FINAL_DIR=$(DIR)/$(TAR_DIR)

REPO=../../PG
REPODIR=doc
SRC_user=ProofGeneral
SRC_adapt=PG-adapting

SRC=_src
CHECKOUT=$(SRC)/PG
DEST=doc
DEST_user=userman
DEST_adapt=adaptingman
HEADER=$(SRC)/_head.html
TEXI_CUSTOM=$(CURDIR)/$(SRC)/texi2html_custom.pm
TEXI2HTML=texi2html --expandinfo --number-sections --split=chapter --noheader --init-file=$(TEXI_CUSTOM)

all: checkout compile doc add

compile: compile.user compile.adapt
doc: doc.user doc.adapt
add: add.user add.adapt

.PHONY: all checkout compile doc add clean distclean

# Phase 0
checkout:
	@echo "### Phase 0"
	$(RM) -r $(CHECKOUT)/$(REPODIR)
	cd $(REPO) && git ls-files -z $(REPODIR) | git checkout-index --prefix=$(CURDIR)/$(CHECKOUT)/ -f --stdin -z
	@echo "### End of Phase 0 -- $(REPODIR) folder checked-out in:"
	@echo "$(CURDIR)/$(CHECKOUT)/$(REPODIR)"

# Phase 1
compile.%:
	@echo "### Phase 1/$*"
	$(RM) -r $(DEST_$*)
	mkdir -p $(DEST_$*)
	# The slash at the beginning of --prefix is required to get proper Jekyll URLs:
	$(TEXI2HTML) --output=.. --prefix=/$(DEST)/$(DEST_$*)/$(SRC_$*) --top-file=/$(DEST)/$(DEST_$*)/index.html $(CHECKOUT)/$(REPODIR)/$(SRC_$*).texi
	@echo "### End of Phase 1/$* -- raw HTML files generated in:"
	@echo "$(CURDIR)/$(DEST_$*)"

# Phase 2
doc.%:
	@echo "### Phase 2/$*"
	cd $(DEST_$*) && for f in *.html; do \
	  mv $$f $$f.bak && \
	  cp -f $(CURDIR)/$(HEADER) $$f && \
	  sed -e '1,/<body\>/d;/<\/body\>/,$$d' \
	  -e 's/\($(SRC_$*)[_0-9A-Za-z]*\)\.html/\1/g' \
	  -e 's|"ProofGeneral-image.jpg"|"/img/ProofGeneral-image.jpg"|g' \
          $$f.bak >> $$f && \
	  $(RM) $$f.bak; \
	done
	@echo "### End of Phase 2/$* -- final HTML files generated in:"
	@echo "$(CURDIR)/$(DEST_$*)"
	@echo "You can now run: bundle exec jekyll serve"

# Phase 3
add.%:
	@echo "### Phase 3/$*"
	git add -v -A $(DEST_$*)
	@echo "### End of Phase 3/$* -- You can now run: git commit"

clean:
	$(RM) -r $(CHECKOUT)/$(REPODIR)
	-rmdir $(CHECKOUT)

distclean: clean
	$(RM) -r $(DEST_user) $(DEST_adapt)
