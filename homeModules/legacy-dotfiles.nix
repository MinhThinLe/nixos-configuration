{ home, config, ... }:
{
    home.file."${config.xdg.configHome}" = {
        source = ./legacyDotfiles;
        recursive = true;
    };
}
