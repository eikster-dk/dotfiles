{ pkgs, config, ... }: {
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./init.fish;
    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair-fish.src;
      }
    ];
    shellAliases = {
      # Assume TODO: fix the granted assume alias correctly
      assume = "source /Users/eikster/.nix-profile/share/assume.fish";

      # docker
      d = "docker";

      # git
      g = "git";
      gl = "git pull --prune";
      glg = "git log --graph --decorate --oneline --abbrev-commit";
      glga = "glg --all";
      gp = "git push origin HEAD";
      gpa = "git push origin --all";
      gd = "git diff";
      gc = "git commit -s";
      gca = "git commit -sa";
      gco = "git checkout";
      gb = "git branch -v";
      ga = "git add";
      gaa = "git add -A";
      gcm = "git commit -sm";
      gcam = "git commit -sam";
      gs = "git status -sb";
      glnext = "git log --oneline (git describe --tags --abbrev=0 @^)..@";
      gw = "git switch";
      gm = "git switch (git main-branch)";
      gms = "git switch (git main-branch); and git sync";
      egms = "e; git switch (git main-branch); and git sync";
      gwc = "git switch -c";

      # worktree related
      gwr = "git worktree remove";
      gwa = "git worktree add";
      gwls = "git worktree list";
      gui = "lazygit";

      #ls
      lsa = "lsd -al --header";

      # go
      gmt = "go mod tidy";
      grm = "go run ./...";

      # neovim
      e = "nvim";
      v = "nvim";

      # tmux
      ta = "tmux-new";
    };
  };

  xdg.configFile."fish/themes/Catppuccin Mocha.theme" = {
    source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/fish/main/themes/Catppuccin%20Mocha.theme";
      sha256 = "kdA9Vh23nz9FW2rfOys9JVmj9rtr7n8lZUPK8cf7pGE=";
    };
  };
}
