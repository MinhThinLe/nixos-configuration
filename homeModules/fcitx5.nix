{ ... }: {

    i18n.inputMethod.fcitx5.settings.globalOptions = {
        Hotkey = {
            TriggerKeys = "";
            EnumerateWithTriggerKeys = true;
            ActivateKeys = "";
            DeactivateKeys = "";
            AltTriggerKeys = "";
            EnumerateSkipFirst = false;
            EnumerateGroupForwardKeys = "";
            EnumerateGroupBackwardKeys = "";
            TogglePreedit = "";
            ModifierOnlyKeyTimeout = 250;
            EnumerateForwadKeys = {
                "0" = "Control+Shift+Shift_L";
            };
            EnumerateBackwardKeys = {
                "0" = "Control+Alt+Alt_L";
            };
            PrevPage = {
                "0" = "Up";
            };
            NextPage = {
                "0" = "Down";
            };
            PrevCandidate = {
                "0" = "Shift+Tab";
            };
            NextCandidate = {
                "0" = "Tab";
            };
        };

        Behavior = {
            ActiveByDefault = false;
            resetStateWhenFocusedIn = "No";
            ShareInputState = "No";
            PreeditEnabledByDefault = true;
            ShowInputMethodInformation = true;
            showInputMethodInformationWhenFocusIn = false;
            CompactInputMethodInformation = true;
            ShowFirstInputMethodInformation = true;
            DefaultPageSize = 5;
            OverrideXkbOption = false;
            CustomXkbOption = "";
            EnabledAddons = "";
            DisabledAddons = "";
            PreloadInputMethod = true;
            AllowInputMethodForPassword = false;
            AutoSavePeriod = 30;
        };
    };
}
