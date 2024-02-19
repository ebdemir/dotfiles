#!/usr/bin/bash 

# if [ $(command -v xrandr) ]; then
#     OFFSETS=$(\xrandr | \grep -w connected | \awk '{split($0, line, " "); if (line[3] == "primary") { split(line[4], offsets, "+"); print "+"offsets[2]"+"offsets[3] } else { split(line[3], offsets, "+"); print "+"offsets[2]"+"offsets[3] }}')
#     for o in $OFFSETS; do
#         xterm -geometry 0x0$o -fullscreen -bg black -class "lockscreen" -e asciiquarium &
#     done
# else
#     xterm -fullscreen -bg black -class "lockscreen" -e asciiquarium &
# fi

# wezterm -e asciiquarium & xtrlock; xdotool key q
xterm -fullscreen -bg black -e asciiquarium & xtrlock; xdotool key q

