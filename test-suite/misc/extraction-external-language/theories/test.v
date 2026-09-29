Declare ML Module "rocq-runtime.plugins.extraction".
Declare ML Module "coq-test-suite.toy_extraction".

Extraction Language Toy.

Inductive color := red | green.
Definition red' := red.

Extraction red'.
Extraction color.
