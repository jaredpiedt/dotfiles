{
  config,
  pkgs,
  ...,
}: {
  enable = true;
  history.size = 10000;
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
  '';
  oh-my-zsh = {
    enable = true;
    plugins = [
      "brew"
      "git"
      "kubectl"
      "zsh-autosuggestions"
      "z"
    ];
  };
  plugins = [
    {
      name = "powerlevel10k-config";
      src = lib.cleanSource ../../.p10k.zsh;
      file = "p10k.zsh";
    }
  ];
}
