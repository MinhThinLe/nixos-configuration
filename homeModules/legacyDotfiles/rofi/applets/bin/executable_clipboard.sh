dir="$HOME/.config/rofi/launchers/type-1"
theme='style-5'

rofi \
    -theme ${dir}/${theme}.rasi \
    -modi clipboard:$HOME/scripts/cliphist.sh \
    -show clipboard

# cliphist list |\
    # rofi -dmenu -display-columns 2 -theme ${theme} -p "Clipboard history" |\
    # cliphist decode |\
    # wl-copy
