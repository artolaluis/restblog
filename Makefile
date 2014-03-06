#
# Copyright 2010. Luis Artola. All rights reserved.
#


#
# ... setup
#

.PHONY: all
.PHONY: clean-all clean-pyc clean-docs
.PHONY: docs docs-api docs-user
.PHONY: version

#
# ... variables
#

SRCTOP := $(PWD)

PROJECT = restblog

VERSION = 1.2.2
VERSION_FILE = $(SRCTOP)/src/restblog/version.py

EPYDOC = epydoc
EPYDOC_SOURCES += $(SRCTOP)/src/restblog
EPYDOC_OUTPUT_DIRECTORY = $(SRCTOP)/docs/build/api
EPYDOC_INDEX = $(EPYDOC_OUTPUT_DIRECTORY)/index.html

SPHINX_INDEX = $(SRCTOP)/docs/build/user/html/index.html


#
# ... rules
#

all: version

clean-all: clean-pyc clean-docs
	-$(RM) -f $(VERSION_FILE)

clean-pyc:
	@find $(SRCTOP) -name '*.pyc' -exec rm -f {} \;

clean-docs:
	-$(RM) -rf $(EPYDOC_OUTPUT_DIRECTORY)
	$(MAKE) -C docs clean

version: Makefile
	@echo "Updating version file to: $(VERSION)"
	@echo VERSION=\'$(VERSION)\' > $(VERSION_FILE)

#
# ... documentation
#

docs: version docs-user

docs-api: version
	@echo
	@echo "-- Generating developer documentation..."
	@echo
	@mkdir -p $(EPYDOC_OUTPUT_DIRECTORY)
	@$(EPYDOC) \
            -v \
            --docformat=reStructuredText \
            --output=$(EPYDOC_OUTPUT_DIRECTORY) \
            $(EPYDOC_SOURCES)
	@echo
	@echo "Quick ways of opening developer documentation:"
	@echo
	@echo "file://$(EPYDOC_INDEX)"
	@echo "open $(EPYDOC_INDEX)"

docs-user: version
	@echo
	@echo "-- Generating user documentation..."
	@echo
	@$(MAKE) -C docs html VERSION=$(VERSION)
	@echo
	@echo "Quick ways of opening user documentation:"
	@echo
	@echo "file://$(SPHINX_INDEX)"
	@echo "open $(SPHINX_INDEX)"

