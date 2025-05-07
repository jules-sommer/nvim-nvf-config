_: {
  fetchNixModules = import ./fetch-nix-modules;

  enabled' = opts:
    {
      enable = true;
    }
    // opts;

  enabled = {
    enable = true;
  };

  disabled' = opts:
    {
      enable = false;
    }
    // opts;

  disabled = {
    enable = false;
  };
}
