DIST_NAME = isrtl

SCRIPT_FILES = \
	src/$(DIST_NAME).ts

all: build lint test coverage esdoc

build: dist/$(DIST_NAME).js
.PHONY: build

build-prod:
	npm run build-prod
	mv -v dist/src/* dist/
.PHONY: build-prod

demo: dist/$(DIST_NAME).js
	npm run demo
.PHONY: demo

check:
	npm run test
.PHONY: check

test: check
.PHONY: test

coverage:
	npm run coverage
.PHONY: coverage

prettier:
	npx prettier --write src test demo
.PHONY: prettier

lint:
	npx eslint --fix $(SCRIPT_FILES)
.PHONY: lint

esdoc:
	npx esdoc
.PHONY: esdoc

doc: esdoc
.PHONY: doc

tar: parsegraph-$(DIST_NAME).tgz
.PHONY: tar

parsegraph-$(DIST_NAME).tgz: dist/$(DIST_NAME).js
	rm -rf parsegraph-$(DIST_NAME)
	mkdir parsegraph-$(DIST_NAME)
	cp -r dist/ README.md LICENSE parsegraph-$(DIST_NAME)
	cp -r package-prod.json parsegraph-$(DIST_NAME)/package.json
	tar cvzf $@ parsegraph-$(DIST_NAME)/
	rm -rf parsegraph-$(DIST_NAME)

dist/$(DIST_NAME).js: package.json package-lock.json $(SCRIPT_FILES)
	npm run build
	mv -v dist/src/* dist/

clean:
	rm -rf dist .nyc_output parsegraph-$(DIST_NAME).tgz
.PHONY: clean
