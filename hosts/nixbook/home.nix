{ pkgs
, lib
, ...
}:
let
  inherit (import ./variables.nix);
in
{
  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "1password-gui"
        "1password"
        "polypane"
      ];
    };
  };

  # Home Manager Settings
  home.username = "eikster";
  home.homeDirectory = "/home/eikster";
  home.stateVersion = "24.05";


  imports = [
    ../../home/features/cli
    ../../home/features/hyprland
  ];

  features = {
    cli = {
      fish.enable = true;
      fastfetch.enable = true;
      kitty.enable = true;
      nvim.enable = true;
      tmux.enable = true;
    };
    hyprland = {
      enable = true;
      dunst.enable = true;
      hyprlock.enable = true;
      hypridle.enable = true;
      hyprpaper.enable = true;
      waybar.enable = true;
      wofi.enable = true;
      fonts.enable = true;
    };
  };
}

