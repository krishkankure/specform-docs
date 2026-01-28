# Minimal Makefile for Sphinx docs (MyST markdown)

SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = docs
BUILDDIR      = docs/_build

.PHONY: help clean html

help:
	@echo "Targets:"
	@echo "  make html   - build HTML docs into $(BUILDDIR)/html"
	@echo "  make clean  - remove build artifacts"

clean:
	rm -rf $(BUILDDIR)

html:
	$(SPHINXBUILD) -b html $(SPHINXOPTS) $(SOURCEDIR) $(BUILDDIR)/html
	@echo
	@echo "Build finished. Open:"
	@echo "  $(BUILDDIR)/html/index.html"
