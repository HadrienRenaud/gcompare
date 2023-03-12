(lang dune 3.7)

(name gcompare)

(generate_opam_files true)

(source
 (github HadrienRenaud/gcompare))

(authors "Hadrien Renaud <hadrien.renaud.22@ucl.ac.uk>")

(maintainers "Hadrien Renaud <hadrien.renaud.22@ucl.ac.uk>")

(package
 (name gcompare)
 (synopsis "A graph comparator util")
 (description "A graph comparator util")
 (depends ocaml dune ocamlgraph)
 (tags
  (dot graph compare)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
