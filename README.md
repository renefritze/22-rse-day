# 22-rse-day

René Fritze  
rene.fritze@wwu.de  

* [Slides](https://renefritze.github.io/22-rse-day)
* [PDF](https://github.com/renefritze/22-rse-day/blob/main/slides/fritze2022_22__rse__day_slides.pdf)

[![GitHub license](https://img.shields.io/github/license/renefritze/22-rse-day.svg)](https://github.com/renefritze/22-rse-day/blob/main/LICENSE)

[Live presentation](https://rene.fritze.me/22-rse-day/)
## Install

1. Install [npm](https://www.npmjs.com/)
2. [Clone](https://git-scm.com/docs/git-clone) this repository
3. make install

```
git clone https://github.com/renefritze/22-rse-day
cd 22-rse-day
make install
```

See [Edits](#edits) and [Implementation](#implementation) for more details.

## Usage

1. Generate `docs/index.html` (see `script.html` in [package.json](https://github.com/renefritze/22-rse-day/blob/main/package.json))
2. Generate `slides/fritze2022_22__rse__day_slides.pdf` (see `script.pdf` in [package.json](https://github.com/renefritze/22-rse-day/blob/main/package.json))

```
make html
make pdf
```

## Developer Notes

### Edits

The following can be edited before generating:

* `slides/fritze2022_22__rse__day_slides.md`: [Markdown](https://daringfireball.net/projects/markdown/) file with slide contents
* `slides/template.html`: Custom [reveal-md](https://github.com/webpro/reveal-md) template to generate slides with
* `docs/edit/style.css`: [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) file to adjust styling of slides
* `docs/edit/logo.png`: logo image to use

### Implementation


The slides [22-rse-day](https://github.com/renefritze/22-rse-day) uses the following [npm](https://www.npmjs.com/) packages for its implementation:

npm | Purpose
--- | ---
[reveal-md](https://www.npmjs.com/package/reveal-md) | Converting `slides/fritze2022_22__rse__day_slides.md` to `docs/index.html`
[decktape](https://www.npmjs.com/package/decktape) | Converting `slides/fritze2022_22__rse__day_slides.md` to `slides/fritze2022_22__rse__day_slides.pdf`
[windows-build-tools](https://www.npmjs.com/package/windows-build-tools) | Compiling dependencies for decktape on Windows Operating System (OS)

```
       reveal-md            <-- Convert markdown  slides to html

       decktape             <-- Convert markdown slides to pdf
          |
  windows-build-tools       <-- Compile decktape on Windows OS
```
