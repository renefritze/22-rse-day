
docs/index.html: slides/fritze2022_22__rse__day_slides.md
	npm run html

slides/fritze2022_22__rse__day_slides.pdf: slides/fritze2022_22__rse__day_slides.md
	npm run pdf

install:
	npm install

html: docs/index.html	

pdf: slides/fritze2022_22__rse__day_slides.pdf
	
watch:
	npm run watch