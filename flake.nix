{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    { nixpkgs, utils, ... }@inputs:
    utils.lib.eachDefaultSystem (system: {
      packages = {
        default =
          (inputs.nvf.lib.neovimConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = [
              {
                config.vim = {
                  theme.enable = true;
                  enableLuaLoader = true;

                  languages = {
                    enableTreesitter = true;
                  };
                };
              }
            ];
          }).neovim;
      };
    });
}
