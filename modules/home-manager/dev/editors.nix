{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      golang.go
      redhat.java
      ms-vscode.cpptools
      bbenoist.nix
      eamodio.gitlens
      mkhl.direnv
      bradlc.vscode-tailwindcss
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      tomoki1207.pdf
    ];
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    
    extraPackages = with pkgs; [
      gcc
      ripgrep
      fd     
      lazygit
      unzip  
      wget
    ];
  };
}
