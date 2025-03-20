all: css

.PHONY: clean
clean:
	rm -f docs/css/*.css docs/css/*.css.map docs/js/*.js
	rm -rf .sass-cache/

.PHONY: deps
deps:
	npm install bootstrap
	npm install jquery

.PHONY: fmt
fmt:
	prettier --config .prettierrc -w scss/custom.scss
	prettier --config .prettierrc -w docs/index.html

.PHONY: publish
publish: clean
	sass --silence-deprecation import,mixed-decls,color-functions,global-builtin scss/custom.scss docs/css/custom.css
	cp node_modules/bootstrap/dist/js/bootstrap.min.js docs/js
	cp node_modules/jquery/dist/jquery.min.js docs/js
