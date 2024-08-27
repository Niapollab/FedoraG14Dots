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
> For example `-v "/path/host:/path/container:Z"`.

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

## Disable Gnome shell extension version validation

Use `gsettings set org.gnome.shell disable-extension-version-validation true` to disable Gnome shell extension version validation.

## Add support your Gnome shell version for specific extension

Edit file `~/.local/share/gnome-shell/extensions/<extension-id>/metadata.json`. Find key `shell-version` and add your version (may be founded by executing `gnome-shell --version` in terminal)

> [!NOTE]
> For example, replace
>
> ```json
>    "shell-version": [
>        "3.38",
>    ]
> ```
>
> To
>
> ```json
>    "shell-version": [
>        "3.38",
>        "40.0"
>    ]
> ```

## Install beta Nvidia drivers

Use `sudo dnf -y --enablerepo=rpmfusion-nonfree-rawhide update "*nvidia*"` to install beta Nvidia drivers.

## Howdy SELinux problems

Create file `howdy.te`

```text
module howdy 1.0;

require {
    type lib_t;
    type xdm_t;
    type v4l_device_t;
    type sysctl_vm_t;
    class chr_file map;
    class file { create getattr open read write };
    class dir add_name;
}

#============= xdm_t ==============
allow xdm_t lib_t:dir add_name;
allow xdm_t lib_t:file { create write };
allow xdm_t sysctl_vm_t:file { getattr open read };
allow xdm_t v4l_device_t:chr_file map;
```

Then you can compile and insert it

```shell
checkmodule -M -m -o howdy.mod howdy.te
semodule_package -o howdy.pp -m howdy.mod
semodule -i howdy.pp
```

## Run X11 Docker applications

1. Provide access to `xhost` for current user or root:

    For current user:

    ```shell
    xhost "+SI:localuser:$(id -un)"
    ```

    For root:

    ```shell
    xhost "+SI:localuser:$(id -un 0)"
    ```

2. Add parameters to `docker run` command:

    ```shell
    -e "DISPLAY=$DISPLAY" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:Z"
    ```

> [!NOTE]
> Add `-u="$(id -u):$(id -g)"` if you use current user instead of root.
