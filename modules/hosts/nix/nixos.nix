{
  options,
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.features.nixSettings;
in
{
  imports = [ inputs.lix.nixosModules.default ];
  config = lib.mkIf cfg.enable {
    nix = {
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
    systemd.services.nix-daemon.serviceConfig.OOMScoreAdjust = lib.mkDefault 250;
  };
}
