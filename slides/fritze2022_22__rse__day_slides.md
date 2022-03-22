---
title:  Automate More - Remember Less
theme: black
separator: '----'
verticalSeparator: '---'
revealOptions:
  transition: 'none'
  controls: true
  slideNumber: false
---

#  Automate More - Remember Less

[René Fritze](mailto:rene.fritze@wwu.de)

<small>Research Software Engineering Day 2022</small>

<small>March 23th, 2022</small>
----

# About Me

- [pyMOR](https://pymor.org)
- [MaRDI4NFDI](https://www.mardi4nfdi.de/about/mission)
- [dune-gdt](https://docs.dune-gdt.org/main/index.html)
- [github](https://github.com/renefritze/)
- [WWU](https://www.uni-muenster.de/AMM/en/ohlberger/team/rene_fritze.shtml)

----

# Why automate tasks

---

## Why automate tasks

1. So I cannot forget (how) to run the task

---

## Why automate tasks

2. Increase reliability

---

## Why automate tasks

3. Save myself time

---

## Why automate tasks

4. It's fun

----

# Caveats

---

![](automation.png)

[source](https://xkcd.com/1319/)

---

![](is_it_worth_the_time.png)

[source](https://xkcd.com/1205/)

----

# pre-commit

General framework for git [pre-commit](https://pre-commit.com/) hooks.

---

## Available hooks

- formatter: black, prettier, clang-format

---

## Available hooks

- detect: large files, leaked credentials, broken symlinks

---

## Available hooks

- fixes: trailing whitespace, file encondings

---

## Available hooks

- linting

---

## Available hooks

- [many, MANY more](https://pre-commit.com/hooks.html)

---

## Real-world example

[.pre-commit-config.yaml](https://github.com/renefritze/22-rse-day/blob/main/.pre-commit-config.yaml)

<pre class="yaml"><code data-trim data-noescape>
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.1.0
    hooks:
    -   id: trailing-whitespace
    -   id: end-of-file-fixer
    -   id: check-yaml
    -   id: check-added-large-files
    -   id: check-executables-have-shebangs
    -   id: check-case-conflict
    -   id: check-symlinks
</code></pre>

<pre class="bash"><code data-trim data-noescape>
python3 -m pip install pre-commit
pre-commit run -a
</code></pre>

---

## Write your own hook

Lots of supported languages. Needs a repo with [metadata file](https://github.com/pre-commit/mirrors-clang-format/blob/master/.pre-commit-hooks.yaml) and optionally executable script.

[Docs](https://pre-commit.com/index.html#new-hooks)

----

# Makefiles

[History](https://en.wikipedia.org/wiki/Make_(software))

---

## Makefiles are good for

- repeatably executing scripts
- managing dependencies between steps

---

## Makefiles are good for

- expressing workflows
- running things in parallel

---

## Rule example

<pre class="makefile"><code data-trim data-noescape>
html:
    node ./node_modules/reveal-md/bin/reveal-md.js slides/fritze2022_22__rse__day_slides.md --static docs \--template slides/template.html
</code></pre>

---

## Working Rule example

<pre class="makefile"><code data-trim data-noescape>
.PHONY: html
html:
    node ./node_modules/reveal-md/bin/reveal-md.js slides/fritze2022_22__rse__day_slides.md --static docs \--template slides/template.html
</code></pre>

---

## Better Rule example

<pre class="makefile"><code data-trim data-noescape>
docs/index.html: slides/fritze2022_22__rse__day_slides.md
    node ./node_modules/reveal-md/bin/reveal-md.js slides/fritze2022_22__rse__day_slides.md --static docs --template slides/template.html
</code></pre>

---

## Why I use Makefiles

- `make` is available everywhere
- it scales well from trivial to complex <https://github.com/pymor/docker/blob/main/Makefile>

---

## Real life examples

- [container build system](https://github.com/pymor/docker/blob/main/Makefile)
- [project setup](https://gist.githubusercontent.com/renefritze/425c4d02d315f246ba58ea3a0c6432e2/raw/ef752f59af47a048634e803ca7ccbd2e10a8b4f5/Makefile)

----

# Aside: Program Input

~~Edit script for different parameters~~

Make script accept config file or cli args input

---

## Benefits

1. Parameter studies in parallel
2. increases Reproducibility
3. Clean history

----

# Continuous Integration / Distribution

(CI/CD)

---

## What is CI/CD?

Service to automatically run workflow on your source.

---

## Platforms

1. Gitlab CI
2. Github Actions
3. Azure Pipelines
4. Circle CI
5. A dozen more

---

## Examples

- Make sure code style is followed
- Run your test suite on every git push for multiple configurations, [prevent merging with failures](https://github.com/WWU-AMM/pytimings/settings/branch_protection_rules/19373418)
- Build and distribute your documentation for git tags
- [Complex example](https://zivgitlab.uni-muenster.de/pymor/pymor/-/pipelines/134461)
- Trigger other workflows

---

## Gitlab CI

- Simpler to use with custom docker images
- Possible to run service containers
- Pages infrastructure with authentication

---

## Github Actions

- Huge number of pre-configured steps (Actions)
- Dependabot
- Pages infrastructure easier with custom domains

----

# Templating

---

## Example

<pre class="python"><code data-trim data-noescape>
import jinja2
template_string = """
# My Project is available for
{%- for py in python %}
{{loop.index}}. {{py}}
{%- endfor -%}
"""
tpl = jinja2.Template(template_string)
print(tpl.render(pythons=['3.9', '3.10']))
</code></pre>

<pre class="markdown"><code data-trim data-noescape>
# My Project is available for
1. 3.9
2. 3.10
</code></pre>

## Use cases

- Parameter Studies
- [Code generation](https://zivgitlab.uni-muenster.de/ag-ohlberger/dune-community/dune-xt/-/raw/master/python/scripts/generate_compare_functions.py)
- [Composable Dockerfiles](https://zivgitlab.uni-muenster.de/ag-ohlberger/dune-community/docker/-/raw/main/debian/python_dbg/Dockerfile.in)
- [Cookiecutters](https://cookiecutter.readthedocs.io/en/2.0.2/)

---

## CI Sanity

<pre class="bash"><code data-trim data-noescape>
./generate.py output_file
git diff --exit-code output_file
</code></pre>

---

## Cookiecutters

Generate entire projects from a [template](https://github.com/renefritze/cookiecutter-reveal).

----

# Automatic bug finding

---

## Prelim

----

# The end

![](qrcode.png)
