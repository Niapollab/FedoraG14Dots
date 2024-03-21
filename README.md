# Fedora notes - Asus ROG Zephyrus G14 GA402XV

## Install different version of Flatpak app

1. Use `flatpak remote-info --log <repo> <app-id>` for getting `<commit>`.
    > [!NOTE]
    > For example `<repo>` will be `flathub`, `<app-id>` will be `io.github.spacingbat3.webcord`. 

2. Use `sudo flatpak update --commit=<commit> <app-id>` for reverting.
    > [!NOTE]
    > Use `sudo flatpak mask <app-id>` for removing it from updates list.
