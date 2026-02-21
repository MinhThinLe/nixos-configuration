{
    config,
    lib,
    ...
}:
{
    options.starship.enable = lib.mkEnableOption "starship";

    config = lib.mkIf config.starship.enable {
        programs.starship.enable = true;

        programs.starship.settings = {
            add_newline = false;
            format = "$directory$git_branch$character";

            character = {
                disabled = false;
                success_symbol = "[➜](bold green)";
                error_symbol = "[✗](bold red)";
                vicmd_symbol = "[N](bold green)";
                format = "$symbol ";
            };

            package.disabled = true;

            git_branch = {
                symbol = " ";
                style = "bold purple bg:0xFCA17D";
                format = "[$symbol$branch(:$remote_branch) ]($style)";
                disabled = false;
            };

            directory.truncation_length = 5;
        };
    };
}
