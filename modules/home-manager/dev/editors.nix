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
    
    # Injetamos as dependências pesadas diretamente no Neovim
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
