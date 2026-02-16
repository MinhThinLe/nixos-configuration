{ pkgs, ... }: {
    stylix.enable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    stylix.cursor = {
        package = pkgs.capitaine-cursors-themed;
        name = "Capitaine Cursors (Gruvbox) - White";
        size = 24;
    };

    stylix.polarity = "dark";
}
