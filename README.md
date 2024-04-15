# Fedora notes - Asus ROG Zephyrus G14 GA402XV

## Install different version of Flatpak app

1. Use `flatpak remote-info --log <repo> <app-id>` for getting `<commit>`.

> [!NOTE]
> For example `<repo>` will be `flathub`, `<app-id>` will be `io.github.spacingbat3.webcord`.

2. Use `sudo flatpak update --commit=<commit> <app-id>` for reverting.

> [!NOTE]
> Use `sudo flatpak mask <app-id>` for removing it from updates list.

## Fix issue with wrong Gnome theme in Flatpak apps

Use `flatpak override --user --env=GTK_THEME=<theme-name> <app-id>` for changing theme for the app.

> [!NOTE]
> For example `<theme-name>` will be `Adwaita:dark`, `<app-id>` will be `org.libreoffice.LibreOffice`.

## Launch GEF from GDB

Use `source ~/.gef.py` in GDB prompt to launch GEF.

## Fix `Permission denied` in Docker volumes

Add `:Z` to volume definition. [See](https://stackoverflow.com/a/31334443) for details.

> [!NOTE]
> For example `-v"/path/host:/path/container:Z"`.

## Find related package by filename

Use `rpm -qf <filename>` to find related package.

> [!NOTE]
> For example `rpm -qf /usr/bin/zsh`.

## Lauch application in `dGPU` mode from console

Use `dgpu <command> <arguments>` to lauch application in dGPU mode.

> [!NOTE]
> For example `dgpu firefox`.
> See [zsh aliases](./configs/zsh/.zsh_aliases) for additional details.

## Uneject media device

Use `eject -t <device>` for connect media devices back after ejecting process.

> [!NOTE]
> For example `eject -t /dev/sda`.
> Use `udisksctl status` or `lsblk` for getting device path.