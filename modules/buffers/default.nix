{
  config.vim = {
    maps.normal = {
      "<leader>bd" = {
        action = ":bd<CR>";
        desc = "Buffer: Delete Current";
      };
      "<leader>bfd" = {
        action = ":bd!<CR>";
        desc = "Buffer: Force Delete";
      };
      "<leader>bs" = {
        action = ":w<CR>";
        desc = "Buffer: Save";
      };
      "<leader>b-" = {
        action = ":bp<CR>";
        desc = "Buffer: Previous";
      };
      "<leader>b=" = {
        action = ":bn<CR>";
        desc = "Buffer: Next";
      };

      "H" = {
        action = ":bp<CR>";
        desc = "Buffer: Previous";
        silent = true;
      };
      "L" = {
        action = ":bn<CR>";
        desc = "Buffer: Next";
        silent = true;
      };
    };

    telescope.mappings.buffers = "<leader>bb";
  };
}
