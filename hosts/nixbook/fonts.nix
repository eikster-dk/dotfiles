{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerdfonts
    font-awesome
  ];
}
