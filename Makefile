.PHONY: test

test:
	chmod +x scripts/run_tests.sh
	./scripts/run_tests.sh 

package:
	pixi run mojo package  src/dotenv -o dotenv.mojopkg

upload:
	export PREFIX_API_KEY={$PREFIX_API_KEY} & bash scripts/publish.sh

build:
	rattler-build build -r src -c https://prefix.dev/mojo-force -c https://repo.prefix.dev/modular-community -c https://conda.modular.com/max-nightly -c conda-forge --skip-existing=all

doc:
	mkdocs serve

shell:
	pixi shell

clean:
	rm -rf output/