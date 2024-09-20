.PHONY: test

test:
	magic run test 

package:
	magic run mojo package  dotenv/ -o dotenv.mojopkg

