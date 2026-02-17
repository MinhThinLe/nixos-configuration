{ home, config, ... }:
{
    home.file."${config.xdg.configHome}" = {
        source = ./legacyDotfiles;
        recursive = true;
    };

    home.file."${config.xdg.configHome}/rofi/launchers/type-1/launcher.sh" = {
        source = ./legacyDotfiles/rofi/launchers/type-1/launcher.sh;
        executable = true;
    };

    home.file."${config.xdg.configHome}/rofi/applets/bin/" = {
        source = ./legacyDotfiles/rofi/applets/bin;
        recursive = true;
        executable = true;
    };

    home.file.".zshrc" = {
        source = ./legacyDotfiles/.zshrc;
    };

    home.file.".zprofile".text = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
            exec niri-session -l
        fi
    '';
}
