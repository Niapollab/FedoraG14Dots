#!/bin/sh
set -e

declare -A OLD_DIRS
while IFS= read -r line; do
    key=${line%=*}
    value=${line#*=}
    OLD_DIRS[$key]=$value
done < <(sed -n 's/^\([^#].*\)=\s*\"\(.*\)\"/\1=\2/p' "$HOME/.config/user-dirs.dirs")

declare -A NEW_DIRS=(
    ['XDG_DESKTOP_DIR']='$HOME/Desktop'
    ['XDG_DOWNLOAD_DIR']='$HOME/Downloads'
    ['XDG_TEMPLATES_DIR']='$HOME/Templates'
    ['XDG_PUBLICSHARE_DIR']='$HOME/Public'
    ['XDG_DOCUMENTS_DIR']='$HOME/Documents'
    ['XDG_MUSIC_DIR']='$HOME/Music'
    ['XDG_PICTURES_DIR']='$HOME/Pictures'
    ['XDG_VIDEOS_DIR']='$HOME/Videos'
)

for key in "${!OLD_DIRS[@]}"
do
    if [[ -n "${NEW_DIRS["$key"]}" ]] 
    then
        old_value="${OLD_DIRS[${key}]}"
        new_value="${NEW_DIRS[${key}]}"

        sed "s#$key=\"$old_value\"#$key=\"$new_value\"#g" -i "$HOME/.config/user-dirs.dirs"
        mv "${old_value//\$HOME/$HOME}" "${new_value//\$HOME/$HOME}"
    fi
done
