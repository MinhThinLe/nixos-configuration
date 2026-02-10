source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

echo $theme

message="Choose a display configuration"
prompt="Display configuration"

option_1="Integrated monitor only"
option_2="External monitor only"
option_3="Extend"
option_4="Duplicate"

rofi_cmd() {
	rofi \
        -theme-str "listview { lines: 4; } window { width: 400px; }" \
		-dmenu \
		-p "$prompt" \
		-mesg "$message" \
		-markup-rows \
		-theme ${theme}
}

run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

action_chosen=$(run_rofi)

case ${action_chosen} in
    $option_1)
        kanshictl switch builtin_monitor_only
        ;;
    $option_2)
        kanshictl switch external_monitor_only
        ;;
    $option_3)
        kanshictl switch extend
        ;;
    $option_4)
        kanshictl switch extend
        exec ~/scripts/present.sh
        ;;
esac
