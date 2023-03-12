open Gcompare.Loader

let do_one fname =
  let () = Format.eprintf "Analysing %s@." (Filename.basename fname) in
  let g = from_file fname in
  let () =
    let n = G.nb_vertex g and m = G.nb_edges g in
    Format.printf "Vertices: %d@." n;
    Format.printf "Edges: %d@." m
  in
  ()

type args = { input_files : string list }

let get_args () =
  let input_files = ref [] in
  let anon_fun fname = input_files := fname :: !input_files in
  let speclist = [] in
  let usage = "parse and display info on some graphs" in
  let () = Arg.parse speclist anon_fun usage in
  { input_files = !input_files }

let () =
  let args = get_args () in
  List.iter do_one args.input_files
