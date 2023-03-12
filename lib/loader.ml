open Graph
module V = Util.DataV (String) (String)

module E = struct
  include String

  let default = ""
end

module G = Graph.Persistent.Digraph.ConcreteLabeled (V) (E)
module B = Builder.P (G)

module L = struct
  open Dot_ast

  let get_label (attr : attr) : string =
    let attr_is_label = function
      | Ident "label", Some (String _) -> true
      | _ -> false
    in
    match List.find_opt attr_is_label attr with
    | Some (_, Some (String lbl)) -> lbl
    | Some _ -> assert false
    | None ->
        Printf.eprintf "Node without any label";
        ""

  let node (node_id : node_id) (attrs : attr list) : B.G.V.label =
    let data = get_label (List.concat attrs) in
    let id =
      match fst node_id with Ident s | String s | Html s | Number s -> s
    in
    V.create id data

  let edge (attrs : attr list) : B.G.E.label = get_label (List.concat attrs)
end

let from_file =
  let module Parse = Graph.Dot.Parse (B) (L) in
  Parse.parse
