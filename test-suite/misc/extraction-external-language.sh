#!/usr/bin/env bash

set -ex

export COQBIN=$BIN
export PATH=$COQBIN:$PATH

cd misc/extraction-external-language/

rocq makefile -f _CoqProject -o Makefile

make clean

make src/toy_extraction_plugin.cmxs

# Unknown languages are rejected until a plugin registers them
if rocq c -q theories/unknown.v 2> log1 1>&2; then
  >&2 echo "unknown.v should have failed"
  exit 1
fi
grep -q 'Unknown extraction language Toy' log1

rocq c -q -I src -Q theories ToyExtraction theories/test.v > log2 2>&1
cat log2
# the quote in red' is turned into an underscore, type names are capitalized
grep -q 'red_' log2
grep -q 'Color' log2

# the Toy language does not support modular extraction
if rocq c -q -I src -Q theories ToyExtraction theories/modular.v 2> log3 1>&2; then
  >&2 echo "modular.v should have failed"
  exit 1
fi
grep -q 'No Toy modular extraction available yet' log3
