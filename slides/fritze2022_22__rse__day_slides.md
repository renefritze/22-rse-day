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

# This talk

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

<pre><code data-trim data-noescape>
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

---

## Makefiles are good for

- expressing complex workflows
- managing dependencies between steps

---

## Rule example

<pre><code data-trim data-noescape>
html:
    node ./node_modules/reveal-md/bin/reveal-md.js slides/fritze2022_22__rse__day_slides.md --static docs \--template slides/template.html
</code></pre>

---

## Working Rule example

<pre><code data-trim data-noescape>
.PHONY: html
html:
    node ./node_modules/reveal-md/bin/reveal-md.js slides/fritze2022_22__rse__day_slides.md --static docs \--template slides/template.html
</code></pre>

---

## Better Rule example

<pre><code data-trim data-noescape>
.PHONY: html
html:
    node ./node_modules/reveal-md/bin/reveal-md.js slides/fritze2022_22__rse__day_slides.md --static docs \--template slides/template.html
</code></pre>

----

# CI

---
## Gitlab CI
---
## Github Actions

----

# project template sanity

if your project configuration from template
