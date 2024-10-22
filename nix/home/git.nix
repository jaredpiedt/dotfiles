{
  config,
  pkgs,
  ...
}: {
  enable = true;
  aliases
  lfs.enable = true;
  userName = "Jared Piedt";
  userEmail = "jared@piedt.com";
  signing.key = null;
  signing.signByDefault = true;

  extraConfig = {
    merge = {
      log = true;
    };
    url = {
      "git@github.com:" = {
        insteadOf = "https://github.com/";
        insteadOf = "github:";
	      insteadOf = "git://github.com/"
      };
      "git@gist.github.com:" = {
        insteadOf = "gst:";
        pushInsteadOf = "gist:";
        pushInsteadOf = "git://gist.github.com/";
      };
    };
  };
}
