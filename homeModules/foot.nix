{ pkgs, config, stylix, ... }: 
{
    stylix.targets.foot.enable = false;

    programs.foot = let foot-theme = pkgs.fetchurl {
        # Because the one from the official repository wouldn't work
        url = "https://codeberg.org/birger/foot/raw/branch/master/themes/gruvbox-dark";
        hash = "sha256-7e3Vwv2TDVsBk7/z5wX8nhWS6VgV5xqnLoCeq/I7QDM=";
    }; in {
        enable = true;
        server.enable = true;
        settings = {
            main = {
                font = "JetBrainsMonoNL NFP:size=12";
                include = "${foot-theme}";
            };
        };
    };
}
