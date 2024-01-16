{ pkgs, ... }: {
  programs.awscli = {
    enable = true;
    settings = {
      "default" = {
         region = "eu-central-1";
         output = "json";
       };
    };
  };

  programs.granted = {
    enable = true;
  };
}
