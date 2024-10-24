{ pkgs, lib, ... }:
{
  enable = true;
  history = {
    ignorePatterns = [
      " *"
      "ls"
      "cd"
      "cd -"
      "pwd"
      "exit"
      "date"
      "* --help"
      "* -h"
    ];
    size = 10000;
  };
  shellAliases = {
    grep = "grep --color=auto";
    localip = "sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'";
    ls = "ls --color";
    mv = "mv -i";
    pubip = "dig +short myip.opendns.com @resolver1.opendns.com";
    rm = "rm -i";
    time = "echo \"Timer started. Stop with Ctrl-D.\" && date && time cat && date";
    vim = "nvim";
  };
  initExtra = ''
    # Set the GPG_TTY to be the same as the tty.
    export GPG_TTY=$(tty)

    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin

    [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
  '';
  oh-my-zsh = {
    enable = true;
    plugins = [
      "brew"
      "git"
      "kubectl"
      "z"
    ];
  };
  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k-config";
      src = lib.cleanSource ./p10k.zsh;
      file = "p10k.zsh";
    }
    {
      # will source zsh-autosuggestions.plugin.zsh
      name = "zsh-autosuggestions";
      src = pkgs.zsh-autosuggestions;
      file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
    }
  ];
}
