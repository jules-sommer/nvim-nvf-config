{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nightly.url = "github:nix-community/neovim-nightly-overlay";
    utils.url = "github:numtide/flake-utils";
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    utils,
    ...
  } @ inputs:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        local = {
          lib = import ./lib {};
        };
        lib = pkgs.lib.extend (_: prev: prev // inputs.nvf.lib // local.lib);
      in {
        inherit lib;
        packages = {
          default =
            (inputs.nvf.lib.neovimConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                inherit inputs lib;
              };
              modules = [
                ./modules
                (
                  {config, ...}: {
                    options.vim.useNightly = lib.mkEnableOption "Enable the use of neovim-nightly via neovim-nightly-overlay flake.";
                    config.vim.package = lib.mkIf config.vim.useNightly inputs.nightly.packages.${system}.default;
                  }
                )
              ];
            }).neovim;
        };
      }
    );
}
