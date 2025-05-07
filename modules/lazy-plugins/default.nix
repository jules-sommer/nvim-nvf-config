{pkgs, ...}: {
  config.vim.lazy.plugins = {
    "undotree" = {
      package = pkgs.vimPlugins.undotree;
      setupModule = "undotree";
      setupOpts = {
      };

      cmd = ["UndotreeToggle"];
      keys = [
        {
          key = "<leader>u";
          action = ":UndotreeToggle<CR>";
          mode = ["n"];
        }
      ];
    };
  };
}
