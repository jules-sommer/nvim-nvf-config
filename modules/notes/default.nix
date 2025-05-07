{lib, ...}: let
  inherit (lib) enabled' enabled;
in {
  config.vim.notes = {
    obsidian = enabled' {
      setupOpts.workspaces = [
        {
          name = "personal";
          path = "~/020_vaults/writing";
        }
        {
          name = "work";
          path = "~/020_vaults/medical";
        }
      ];
    };

    mind-nvim = enabled;
    todo-comments = enabled;
  };
}
