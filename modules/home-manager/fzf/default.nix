{ config
, lib
, pkgs
, ...
}:
with lib; let
  cfg = config.features.cli.fzf;
in
{
  options.features.cli.fzf.enable = mkEnableOption "enable fzf";

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
