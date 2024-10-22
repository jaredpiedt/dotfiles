{
  config,
  pkgs,
  ...
}: {
  enable = true;
  userName = "Jared Piedt";
  userEmail = "jared@piedt.com";
  signing.key = null;
  signing.signByDefault = true;
  extraConfig = {
    color = {
      "branch" = {
        current = "yellow reverse";
        local = "yellow";
        remote = "green";
      };
      "diff" = {
        meta = "yellow bold";
        frag = "magenta bold";
        old = "red";
        new = "green";
      };
      "status" = {
        added = "yellow";
        changed = "green";
        untracked = "cyan";
      };
    };
    merge = {
      log = true;
    };
    url = {
      # Multiple insteadOf configurations for GitHub
      "git@github.com:" = {
        insteadOf = "https://github.com/";
      };
      "github:" = {
        insteadOf = "https://github.com/";
      };
      "git://github.com/" = {
        insteadOf = "https://github.com/";
      };
      
      # Multiple pushInsteadOf for gist
      "git@gist.github.com:" = {
        insteadOf = "gst:";
        pushInsteadOf = "gist:";
      };
      "git://gist.github.com/" = {
        pushInsteadOf = "gist:";
      };
    };
  };
}
