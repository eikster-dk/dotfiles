{ pkgs, ... }: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  home.packages = with pkgs; [
    (pkgs.callPackage ../packages/scripts/default.nix { })
    (pkgs.callPackage ../packages/granted/default.nix { })
    air
    aws-sso-cli
    colmena
    comma
    dogdns
    fd
    go-task
    hurl
    jq
    k6
    karabiner-elements
    lazydocker
    ngrok
    nodejs_20
    nodePackages.pnpm
    ripgrep
    rsync
    sqlc
    tailwindcss
    tree
    ulid
    zk
  ];
}

