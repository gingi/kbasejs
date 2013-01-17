PACKAGE  = jslibs
UGLIFY = ./node_modules/uglify-js/bin/uglifyjs

KBLIB ?= kbase.js
KBLIBMIN ?= $(KBLIB:.js=.min.js)

all: uglify

uglify:
	$(UGLIFY) -c -m --comments < $(KBLIB) > $(KBLIBMIN)
	
.PHONY: uglify all