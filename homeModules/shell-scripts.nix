{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        (writeShellScriptBin "clipboard-manager" (builtins.readFile ./shellScripts/clipboard-manager.sh))
        (writeShellScriptBin "nightlight" (builtins.readFile ./shellScripts/nightlight.sh))
        (writeShellScriptBin "present" (builtins.readFile ./shellScripts/present.sh))
    ];

    home.file.".zprofile".text = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
            exec niri-session -l
        fi
    '';

    home.file."${config.xdg.dataHome}/nvim/mason/bin/prettify-table" = {
        text = "tr -s \" \" | column -t -s '|' -o '|'";
        executable = true;
    };
}
