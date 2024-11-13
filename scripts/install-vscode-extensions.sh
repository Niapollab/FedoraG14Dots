#!/bin/bash
set -e

EXTENSIONS=(
    # Dracula theme
    "dracula-theme.theme-dracula"
    # Colorful comments
    "aaron-bond.better-comments"
    # Markdown utils
    "DavidAnson.vscode-markdownlint"
    "yzhang.markdown-all-in-one"
    # Gitlens
    "eamodio.gitlens"
    # Docker
    "ms-azuretools.vscode-docker"
    # C#
    "ms-dotnettools.csdevkit"
    "ms-dotnettools.csharp"
    # Python
    "ms-python.python"
    "charliermarsh.ruff"
    # Python (Jupyter)
    "ms-toolsai.jupyter"
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
    # PDF Reader
    "tomoki1207.pdf"
    # Rust
    "1YiB.rust-bundle"
    "fill-labs.dependi"
    # ChatGPT Integration
    "genieai.chatgpt-vscode"
    "Codeium.codeium"
    # Lua
    "sumneko.lua"
)

for extension in "${EXTENSIONS[@]}"
do
    code --install-extension "$extension"
done
