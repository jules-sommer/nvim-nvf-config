{lib, ...}: let
  inherit
    (lib)
    disabled'
    disabled
    enabled
    enabled'
    fetchNixModules
    ;
in {
  imports = fetchNixModules ./.;

  config = {
    vim = {
      enableLuaLoader = true;
      useSystemClipboard = true;
      viAlias = true;
      vimAlias = true;

      debugMode = disabled' {
        level = 16;
        logFile = "/tmp/nvim.log";
      };

      options = {
        shiftwidth = 2;
      };

      spellcheck = {
        enable = true;
      };

      lsp = {
        formatOnSave = true;
        lspkind = disabled;
        lightbulb = enabled' {
          setupOpts = {
            virtual_text = {
              enabled = true;
            };
          };
        };
        lspsaga = disabled;
        trouble = enabled;
        lspSignature = enabled;
        otter-nvim = enabled;
        nvim-docs-view = enabled;
      };

      debugger = {
        nvim-dap = enabled' {
          ui.enable = true;
        };
      };

      visuals = {
        nvim-scrollbar = enabled;
        nvim-web-devicons = enabled;
        nvim-cursorline = enabled;
        # cinnamon-nvim = enabled;
        # fidget-nvim = enabled;

        rainbow-delimiters = enabled;
        highlight-undo = enabled;
        indent-blankline = let
          highlight = [
            "RainbowDelimiterRed"
            "RainbowDelimiterYellow"
            "RainbowDelimiterBlue"
            "RainbowDelimiterOrange"
            "RainbowDelimiterGreen"
            "RainbowDelimiterViolet"
            "RainbowDelimiterCyan"
          ];
        in
          disabled' {
            setupOpts = {
              viewport_buffer = {
                min = 10;
                max = 60;
              };
              exclude = {
                buftypes = [
                  "terminal"
                  "quickfix"
                ];
                filetypes = [
                  "startup"
                ];
              };
              indent = {
                char = "┆";
                tab_char = "┆";
                inherit highlight;
                priority = 1;
              };
              scope = {
                show_end = false;
                show_exact_scope = false;
                show_start = false;

                inherit highlight;
                priority = 1024;
              };
            };
          };
      };

      statusline.lualine = enabled' {
        theme = "tokyonight";
      };

      theme = enabled' {
        name = "tokyonight";
        style = "storm";
        transparent = true;
      };

      autopairs.nvim-autopairs = enabled;

      autocomplete.nvim-cmp = enabled;
      snippets.luasnip = enabled;

      tabline = {
        nvimBufferline = disabled;
      };

      treesitter.context = enabled;

      binds = {
        # whichKey = enabled;
        # cheatsheet = enabled;
      };

      telescope = enabled;

      git = enabled' {
        gitsigns = enabled' {
          codeActions = enabled;
        };
      };

      minimap = {
        codewindow = enabled;
      };

      dashboard = {
        dashboard-nvim.enable = false;
        alpha = enabled;
      };

      notify = {
        nvim-notify = enabled;
      };

      projects = {
        project-nvim = enabled;
      };

      mini = {
        tabline = enabled;
      };

      utility = {
        snacks-nvim = enabled' {
          setupOpts = {
            bigfile = enabled;
            dashboard = enabled;
            explorer = enabled;
            indent = enabled;
            input = enabled;
            notifier = {
              enabled = true;
              timeout = 2000;
            };
            picker = enabled;
            quickfile = enabled;
            scope = enabled' {
              min_size = 2;
              max_size = null;
              cursor = true;
              edge = true;
              siblings = true;
              debounce = 30;
              treesitter = {
                enabled = true;
                injections = true;
                blocks = enabled;
              };
            };
            scroll = enabled;
            statuscolumn = enabled;
            words = enabled;
            styles = {
              notification = {
                wo = {
                  wrap = true;
                };
              };
            };
          };
        };
        ccc.enable = false;

        diffview-nvim = enabled;
        yanky-nvim = enabled;
        icon-picker = enabled;
        surround = enabled;
        multicursors = disabled;

        motion = {
          hop = enabled;
          precognition = disabled;
        };

        images = {
          image-nvim = {
            enable = true;
            setupOpts.backend = "kitty";
          };
        };
      };

      terminal.toggleterm = enabled' {
        lazygit = enabled;
      };

      ui = {
        borders = enabled;
        noice = enabled;
        colorizer = enabled;
        modes-nvim = enabled; # the theme looks terrible with catppuccin
        illuminate = enabled;
        breadcrumbs = enabled' {
          navbuddy = enabled;
        };

        smartcolumn = enabled' {
          setupOpts.custom_colorcolumn = {
            # this is a freeform module, it's `buftype = int;` for configuring column position
            nix = "110";
            ruby = "120";
            java = "130";
            go = [
              "90"
              "130"
            ];
          };
        };
        fastaction = enabled;
      };

      assistant.copilot = enabled' {
        cmp = enabled;
      };

      session = {
        nvim-session-manager.enable = false;
      };

      comments = {
        comment-nvim = enabled;
      };
    };
  };
}
