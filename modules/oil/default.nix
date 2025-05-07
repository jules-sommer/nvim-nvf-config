_: {
  vim.keymaps = [
    {
      key = "<leader>o";
      lua = true;
      mode = ["n"];
      silent = true;
      action = "require('oil').open_float";
    }
    {
      key = "<C-c>";
      lua = true;
      mode = ["n"];
      silent = true;
      action = "require('oil').close";
    }
  ];

  vim.utility.oil-nvim = {
    enable = true;
    setupOpts = {
      columns = ["icon"];

      float = {
        padding = 3;
        border = "rounded";
      };

      view_options = {
        show_hidden = false;
      };

      skip_confirm_for_simple_edits = true;
      prompt_save_on_select_new_entry = true;
      delete_to_trash = true;
      constrain_cursor = "editable";
      default_file_explorer = true;
      watch_for_changes = true;
      use_default_keymaps = true;
    };
  };
}
