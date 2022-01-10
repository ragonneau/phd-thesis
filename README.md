# Ph.D. thesis of Tom M. Ragonneau

[![Build](https://github.com/ragonneau/phd-thesis/actions/workflows/build.yml/badge.svg)](https://github.com/ragonneau/phd-thesis/actions/workflows/build.yml)

LaTeX source files of the Ph.D. thesis of Tom M. Ragonneau.

## Getting started

To generate the PDF version of the dissertation, you first need to install [latexmk](https://ctan.org/pkg/latexmk?lang=en) v4.51 or later.
Next, clone this repository, and load the bibliography:

```bash
git submodule update --init
```

The PDF file can be generated with:

```bash
make
```
