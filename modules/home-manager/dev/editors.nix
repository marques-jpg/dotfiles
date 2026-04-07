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
    ];
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    
    extraPackages = with pkgs; [
      gcc      # Necessário para compilar as árvores de sintaxe (Treesitter)
      ripgrep  # O motor de pesquisa de texto mais rápido do mundo
      fd       # Alternativa super rápida ao comando 'find'
      lazygit  # Interface espetacular para o Git dentro do Neovim
      unzip    # Necessário para extrair alguns servidores de linguagem
      wget
    ];
  };
}
