#!/usr/bin/env bash

set -e
set -x

TIMESTAMP=$(date "+%FT%H-%M-%S%Z")
for f in *.pdf; do
    mv "$f" "${f%.*}_${GITHUB_ACTOR}_${TIMESTAMP}.pdf"
done
