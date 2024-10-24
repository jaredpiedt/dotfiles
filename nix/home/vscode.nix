{ pkgs, ... }:
{
  enable = true;
  extensions = with pkgs.vscode-extensions; [
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
    "aws.telemetry" = false;
    "dbt.altimateAiKey" = "8b4a3543fcb2812c368ac2f07f077f97";
    "dbt.altimateInstanceName" = "greynoise";
    "dbt.fileNameTemplateGenerateModel" = "{prefix}_{sourceName}__{tableName}";
    "dbt.enableCollaboration" = false;
    "dbt.prefixGenerateModel" = "stg";
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
    "[graphql]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
    };
    "[helmfile]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = false;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
    };
    "[hcl]" = {
      "editor.tabSize" = 2;
    };
    "[javascript]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
    };
    "javascript.updateImportsOnFileMove.enabled" = "always";
    "[json]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "editor.quickSuggestions.strings" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
      "editor.suggest.insertMode" = "replace";
      "gitlens.codeLens.scopes" = [ "document" ];
    };
    "[jsonc]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "editor.quickSuggestions.strings" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
      "editor.suggest.insertMode" = "replace";
      "gitlens.codeLens.scopes" = [ "document" ];
    };
    "[markdown]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
    };
    "merge-conflict.codeLens.enabled" = false;
    "[nix]" = {
      "editor.formatOnSave" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
    };
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
    "prisma.showPrismaDataPlatformNotification" = false;
    "protoc" = { };
    "sqlfluff.dialect" = "snowflake";
    "sqlfluff.format.languages" = [
      "sql"
      "sql-bigquery"
      "jinja-sql"
      "postgres"
      "snowflake-sql"
    ];
    "sqlfluff.linter.run" = "onSave";
    "sqlfluff.format.enabled" = true;
    "sqlfluff.experimental.format.executeInTerminal" = true;
    "tailwindCSS.experimental.classRegex" = [
      [
        "clsx\\(([^)]*)\\)"
        "(?:'|\"|`)([^']*)(?:'|\"|`)"
      ]
    ];
    "[terraform]" = {
      "editor.defaultFormatter" = "hashicorp.terraform";
      "editor.formatOnSave" = true;
      "editor.tabSize" = 2;
    };
    "terraform.languageServer.terraform.path" = "/opt/homebrew/bin/terraform";
    "[typescriptreact]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
    };
    "window.zoomLevel" = 1;
    "workbench.colorTheme" = "One Dark Pro Darker";
    "[yaml]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
      "editor.autoIndent" = "advanced";
      "gitlens.codeLens.scopes" = [ "document" ];
    };
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
