{ inputs
, lib
, config
, pkgs
, ...
}:
{
  imports = [
    inputs.self.homeMangerModules.eikster
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
  home.username = "eikftg";
  home.homeDirectory = "/Users/eikftg";
  home.sessionVariables = {
    EDITOR = "nvim";
    PROJECTS = "$HOME/code";
  };

  home.packages =
    with pkgs; [
      ### nixos + darwin packages
      comma
      dogdns
      fd
      nodejs_20
      go-task
      ripgrep
      tailwindcss
      tree
      ulid
    ]
    ### darwin specific packages
    ++ (lib.optionals (pkgs.system == "aarch64-darwin") [
      ## todo, improve this
      (pkgs.callPackage ../../../packages/scripts/default.nix { })
      karabiner-elements
    ])
    ### nixos specific packages
    ++ (lib.optionals (pkgs.system != "aarch64-darwin") [
    ]);

  features = {
    suites = {
      all.enable = true;
    };
    macos = {
      aerospace.enable = true;
    };
  };
}
