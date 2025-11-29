edit:
    hx ~/justfile
commit:
    #!/usr/bin/env bash   
    edited=$(gum input  --prompt.foreground "#04B575" --prompt "Commit message:" --placeholder "Added dailies" )
    gum confirm && git commit -m $edited
edit-bash:
    hx ~/.bash_profile ~/.bash_aliases
edit-hx:
    hx ~/.config/helix/languages.toml ~/.config/helix/config.toml
edit-wez:
    hx ~/.wezterm.lua ~/.bash_wezterm_completion.sh
write:
    ~/bin/now.sh
i3:
    hx /home/karma/.bashrc  /home/karma/.config/i3/i3config.toml  /home/karma/.config/i3/config
