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

tar: parsegraph-$(DIST_NAME)-dev.tgz
.PHONY: tar

tar-prod: parsegraph-$(DIST_NAME)-prod.tgz
.PHONY: tar

parsegraph-$(DIST_NAME)-prod.tgz: dist/$(DIST_NAME)-prod.js
	rm -rf parsegraph-$(DIST_NAME)
	mkdir parsegraph-$(DIST_NAME)
	cp -r dist/ README.md LICENSE parsegraph-$(DIST_NAME)
	mv parsegraph-$(DIST_NAME)/dist/$(DIST_NAME)-prod.js parsegraph-$(DIST_NAME)/dist/$(DIST_NAME).js
	cp -r package-prod.json parsegraph-$(DIST_NAME)/package.json
	tar cvzf $@ parsegraph-$(DIST_NAME)/
	rm -rf parsegraph-$(DIST_NAME)

parsegraph-$(DIST_NAME)-dev.tgz: dist/$(DIST_NAME).js
	rm -rf parsegraph-$(DIST_NAME)
	mkdir parsegraph-$(DIST_NAME)
	cp -r -t parsegraph-isrtl package.json package-lock.json README.md demo/ LICENSE dist/
	tar cvzf $@ parsegraph-isrtl/
	rm -rf parsegraph-$(DIST_NAME)

dist/$(DIST_NAME).js: package.json package-lock.json $(SCRIPT_FILES)
	npm run build
	mv -v dist/src/* dist/

dist/$(DIST_NAME)-prod.js: package.json package-lock.json $(SCRIPT_FILES)
	npm run build-prod
	mv -v dist/src/* dist/

clean:
	rm -rf dist .nyc_output parsegraph-$(DIST_NAME)-dev.tgz parsegraph-$(DIST_NAME)-prod.tgz
	rm -rf parsegraph-$(DIST_NAME)
.PHONY: clean
