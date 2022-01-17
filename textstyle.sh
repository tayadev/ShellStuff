#!/bin/sh
reset='[0m'
bold='[1m'
dim='[2m'
italic='[3m'
underlined='[4m'
blink='[5m'
blink_fast='[6m'
invert='[7m'
strikethrough='[9m'
double_underlined='[21m'
for c in 0-black 1-red 2-green 3-yellow 4-blue 5-magenta 6-cyan 7-white ;do
    eval "${c#*-}"="[$((${c%-*}+30))m"
    eval "${c#*-}_bg"="[$((${c%-*}+40))m"
    eval "${c#*-}_bright"="[$((${c%-*}+90))m"
    eval "${c#*-}_bright_bg"="[$((${c%-*}+100))m"
done
fg() { printf '[38;2;%d;%d;%dm' "$1" "$2" "$3"; }
bg() { printf '[48;2;%d;%d;%dm' "$1" "$2" "$3"; }
underline_color() { printf '[58;2;%d;%d;%dm' "$1" "$2" "$3"; }