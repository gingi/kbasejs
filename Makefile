PACKAGE  = jslibs
UGLIFY = ./node_modules/uglify-js/bin/uglifyjs

KBLIB ?= kbase.js
KBLIBMIN ?= $(KBLIB:.js=.min.js)

all: uglify

uglify:
	@ $(UGLIFY) -c -m --comments < $(KBLIB) > $(KBLIBMIN) 2> uglify.out
	@ echo "Uglified with "$(shell grep -c '^WARN' uglify.out)" warnings."
	
.PHONY: uglify all