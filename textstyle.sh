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
for c in black red green yellow blue magenta cyan white ;do
    for i in $(seq 7); do
        eval "$c"="[$((i+30))m"
        eval "${c}_bg"="[$((i+40))m"
        eval "${c}_bright"="[$((i+90))m"
        eval "${c}_bright_bg"="[$((i+100))m"
    done
done
fg() { printf '[38;2;%d;%d;%dm' "$1" "$2" "$3"; }
bg() { printf '[48;2;%d;%d;%dm' "$1" "$2" "$3"; }
underline_color() { printf '[58;2;%d;%d;%dm' "$1" "$2" "$3"; }