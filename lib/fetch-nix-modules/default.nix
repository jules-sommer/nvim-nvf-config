path: let
  entries = builtins.readDir path;
  names = builtins.attrNames entries;
  isModule = name: let
    entryType = entries.${name};
  in
    entryType == "directory" && builtins.pathExists "${path}/${name}/default.nix";
  moduleNames = builtins.filter isModule names;
in
  map (name: path + "/${name}") moduleNames
