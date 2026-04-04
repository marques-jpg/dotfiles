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
    ];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
