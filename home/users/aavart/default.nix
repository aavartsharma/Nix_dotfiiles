{ pkgs, homeStateVersion, inputs, pkgs_unstable, ... }: {
  imports = [
    inputs.nix4nvchad.homeManagerModules.default
    ../../modules/applications.nix
    ../../modules/bash.nix
    ../../modules/userSetting.nix
    ../../modules/git.nix 
    ../../modules/packages.nix
    ../../modules/setting.nix
    ../../modules/packages.nix
  ];

  home = {
    username = "aavart";
    homeDirectory = "/home/aavart";
    stateVersion = "26.05";
  };
  userSettings = {
    name="aavartsharma";
    email="rockstarfan0369@gmail.com";
  };
  
  programs.home-manager.enable = true;
  programs.firefox.enable= true;
  programs.nvchad={
    enable= true;
    extraConfig = ''
      -- Custom vim options
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.expandtab = true
      vim.wo.relativenumber = true
  
      -- Custom keymaps
    '';
    extraPackages = with pkgs; [
      ripgrep
      fd
      fzf

      # Lua
      lua-language-server
      stylua
      
      # Nix
      nil
      nixfmt-rfc-style

      # Python
      pyright 
      black

      # Rust
      rust-analyzer
      rustfmt

      # C / C++
      clang-tools

      # C# 
      csharpier

      # JS 
      typescript-language-server
      prettier

      # Markdown
      marksman

      # Bash
      bash-language-server
      shellcheck
      shfmt
      
      # YAML / JSON
      yaml-language-server

      # Shell
      bash-language-server
    ];
  };
  programs.bash = {
    enable = true;
    shellAliases={
      n = "nnn";
    };
  };
  programs.nnn ={
    enable = true;
    quitcd = true;
  };
}
