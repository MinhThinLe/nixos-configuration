{ ... }:
{
    programs.keepassxc = {
        autostart = true;
        enable = true;
        settings = {
            FdoSecrets.Enabled = true;
            Browser.Enabled = true;
            GUI.TrayIconAppearance = "monochrome-light";
        };
    };

    xdg.autostart.enable = true;
}
