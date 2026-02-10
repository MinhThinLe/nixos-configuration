{ home, ... }:
{
    programs.foot.enable = true;
    programs.foot.server.enable = true;
    programs.foot.settings = {
        font = "JetBrains Mono"
    };
    pkgs.programs.foot.theme = "gruvbox-dark";
}
