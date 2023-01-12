# Ph.D. thesis of Tom M. Ragonneau

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ragonneau/phd-thesis/build.yml?logo=github&style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/ragonneau/phd-thesis?logo=github&style=for-the-badge)

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
