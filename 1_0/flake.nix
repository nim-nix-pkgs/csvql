{
  description = ''csvql.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-csvql-1_0.flake = false;
  inputs.src-csvql-1_0.owner = "Bennyelg";
  inputs.src-csvql-1_0.ref   = "refs/tags/1.0";
  inputs.src-csvql-1_0.repo  = "csvql";
  inputs.src-csvql-1_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-csvql-1_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-csvql-1_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}