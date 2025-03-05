{ pkgs, ... }:
{
  enable = true;
  extensions = with pkgs.vscode-marketplace; [
    adpyke.codesnap
    # amazonwebservices.aws-toolkit-vscode
    bradlc.vscode-tailwindcss
    # bufbuild.vscode-buf
    # cosmicsarthak.cosmicsarthak-neon-theme
    dbaeumer.vscode-eslint
    # dorzey.vscode-sqlfluff
    dracula-theme.theme-dracula
    eamodio.gitlens
    # emeraldwalk.runonsave
    esbenp.prettier-vscode
    github.copilot
    github.copilot-chat
    golang.go
    graphql.vscode-graphql-syntax
    hashicorp.hcl
    hashicorp.terraform
    # innoverio.vscode-dbt-power-user
    jnoortheen.nix-ide
    # makeoptim.istio-snippets
    mechatroner.rainbow-csv
    # mquandalle.graphql
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
    ms-python.debugpy
    ms-python.python
    ms-python.vscode-pylance
    prisma.prisma
    redhat.vscode-yaml
    samuelcolvin.jinjahtml
    # sourcepirate.hclfmt
    tim-koehler.helm-intellisense
    zhuangtongfa.material-theme
    zxh404.vscode-proto3
  ];

  userSettings = {
    "[graphql]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.tabSize" = 2;
      "editor.formatOnSave" = true;
    };
    "[hcl]" = {
      "editor.tabSize" = 2;
    };
    "[helmfile]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = false;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
    };
    "[javascript]" = {
      "editor.codeActionsOnSave" = {
        "source.fixAll.eslint" = "explicit";
      };
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
    };
    "[json]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
      "editor.suggest.insertMode" = "replace";
      "gitlens.codeLens.scopes" = [ "document" ];
    };
    "[jsonc]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
      "editor.suggest.insertMode" = "replace";
      "gitlens.codeLens.scopes" = [ "document" ];
    };
    "[markdown]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
    };
    "[nix]" = {
      "editor.formatOnSave" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
    };
    "[prisma]" = {
      "editor.defaultFormatter" = "Prisma.prisma";
      "editor.formatOnSave" = true;
    };
    "[terraform]" = {
      "editor.defaultFormatter" = "hashicorp.terraform";
      "editor.formatOnSave" = true;
      "editor.tabSize" = 2;
    };
    "[typescript]" = {
      "editor.codeActionsOnSave" = {
        "source.fixAll.eslint" = "explicit";
      };
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
    };
    "[typescriptreact]" = {
      "editor.codeActionsOnSave" = {
        "source.fixAll.eslint" = "explicit";
      };
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
    };
    "[yaml]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
      "editor.autoIndent" = "advanced";
      "gitlens.codeLens.scopes" = [ "document" ];
    };
    "diffEditor.maxComputationTime" = 0;
    "editor.fontFamily" = "CommitMono, Menlo, Monaco, 'Courier New', monospace";
    "editor.fontLigatures" = true;
    "editor.fontSize" = 13;
    "editor.inlineSuggest.enabled" = true;
    "explorer.confirmDragAndDrop" = false;
    "files.associations" = {
      "*.grapqhls" = "graphql";
      "*.sql" = "jinja-sql";
      "**/target/**" = ""; # greys out compiled sql
    };
    "files.insertFinalNewline" = true;
    "git.mergeEditor" = false;
    "github.copilot.editor.enableAutoCompletions" = true;
    "github.copilot.enable" = {
      "*" = true;
      "yaml" = true;
      "plaintext" = true;
      "markdown" = false;
      "scminput" = false;
    };
    "go.lintTool" = "golangci-lint";
    "go.lintFlags" = [
      "--fast"
      "--fix"
    ];
    "go.toolsManagement.autoUpdate" = true;
    "gopls" = {
      "build.buildFlags" = [
        "-tags"
        "tools,integration_test"
      ];
    };
    "javascript.updateImportsOnFileMove.enabled" = "always";
    "merge-conflict.codeLens.enabled" = false;
    "nix.enableLanguageServer" = true;
    "nix.formatterPath" = "nixfmt";
    "nix.serverPath" = "nixd";
    "nix.serverSettings" = {
      "nixd" = {
        "formatting" = {
          "command" = "nixfmt";
        };
      };
    };
    "prettier.singleQuote" = true;
    "tailwindCSS.experimental.classRegex" = [
      [
        "clsx\\(([^)]*)\\)"
        "(?:'|\"|`)([^']*)(?:'|\"|`)"
      ]
    ];
    "terraform.languageServer.terraform.path" = "${pkgs.unstable.terraform}/bin/terraform";
    "window.zoomLevel" = 1;
    "workbench.colorTheme" = "One Dark Pro Darker";
    "yaml.completion" = false;
    "yaml.customTags" = [
      "!And"
      "!And sequence"
      "!If"
      "!If sequence"
      "!Not"
      "!Not sequence"
      "!Equals"
      "!Equals sequence"
      "!Or"
      "!Or sequence"
      "!FindInMap"
      "!FindInMap sequence"
      "!Base64"
      "!Join"
      "!Join sequence"
      "!Cidr"
      "!Ref"
      "!Sub"
      "!Sub sequence"
      "!GetAtt"
      "!GetAZs"
      "!ImportValue"
      "!ImportValue sequence"
      "!Select"
      "!Select sequence"
      "!Split"
      "!Split sequence"
    ];
  };
}
