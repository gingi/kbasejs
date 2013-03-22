PACKAGE   = jslibs
UGLIFY    = ./node_modules/uglify-js/bin/uglifyjs
MOCHA     = ./node_modules/mocha/bin/mocha
MOCHAOPTS =

KBLIB ?= kbase.js
KBLIBMIN ?= $(KBLIB:.js=.min.js)

all: uglify

uglify:
	@ rm -f uglify.out
	@ $(UGLIFY) -c -m --comments < $(KBLIB) > $(KBLIBMIN) 2> uglify.out
	@ echo "Uglified with "$(shell grep -c '^WARN' uglify.out)" warnings."
	
test:
	@ $(MOCHA) $(MOCHAOPTS)
	
.PHONY: uglify test all