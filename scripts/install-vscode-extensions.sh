#!/bin/sh
set -e

EXTENSIONS=(
    # Colorful comments
    "aaron-bond.better-comments"
    # Markdown linter
    "DavidAnson.vscode-markdownlint"
    # Gitlens
    "eamodio.gitlens"
    # Docker
    "ms-azuretools.vscode-docker"
    # C#
    "ms-dotnettools.csdevkit"
    "ms-dotnettools.csharp"
    # Python
    "ms-python.python"
    # Remote managment
    "ms-vscode-remote.vscode-remote-extensionpack"
    # Hex editor
    "ms-vscode.hexeditor"
    # Errors inlining
    "usernamehw.errorlens"
    # Intelligence
    "VisualStudioExptTeam.vscodeintellicode"
    "ms-dotnettools.vscodeintellicode-csharp"
    # Shell-check
    "timonwong.shellcheck"
    # C++
    "ms-vscode.cpptools"
)

for extension in "${EXTENSIONS[@]}"
do
    code --install-extension "$extension"
done
