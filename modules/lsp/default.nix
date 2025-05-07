{ lib, ... }:
let
  inherit (lib) enabled' enabled disabled;
in
{
  config.vim.languages = {
    enableLSP = true;
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    nix = enabled;
    markdown = enabled;
    bash = enabled;
    clang = enabled;
    css = enabled;
    html = enabled;
    sql = enabled;
    java = enabled;
    kotlin = enabled;
    ts = enabled;
    go = enabled;
    lua = enabled;
    zig = enabled;
    python = enabled;
    typst = enabled;
    rust = enabled' {
      crates = enabled;
    };
    assembly = enabled;
    tailwind = enabled;

    astro = disabled;
    nu = disabled;
    csharp = disabled;
    julia = disabled;
    vala = disabled;
    scala = disabled;
    r = disabled;
    gleam = enabled;
    dart = disabled;
    ocaml = enabled;
    elixir = enabled;
    haskell = disabled;
    ruby = disabled;
    fsharp = disabled;
    svelte = disabled;
  };
}
