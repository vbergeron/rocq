- **Added:**
  plugins can provide additional extraction target languages by
  registering a language description with ``Common.register_language``,
  after which :cmd:`Extraction Language` accepts its name; the lexical
  conventions that were hard-coded per language (identifier sanitization,
  capitalization of type names, native char and string types, support for
  modular extraction, naming of the toplevel module) are now fields of
  the language description, see :ref:`extraction-external-languages`
  (`#22487 <https://github.com/rocq-prover/rocq/pull/22487>`_,
  by Valentin Bergeron).
