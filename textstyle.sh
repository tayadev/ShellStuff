#!/bin/sh
for i in reset:0 bold:1 dim:2 italic:3 underlined:4 blink:5 blink_fast:6 invert:7 strikethrough:9 double_underlined:21; do eval "${i%:*}=[${i#*:}m";done
for i in black:0 red:1 green:2 yellow:3 blue:4 magenta:5 cyan:6 white:7; do k=${i%:*};v=${i#*:}; eval "${k}=[3${v}m;${k}_bg=[4${v}m;${k}_bright=[9${v}m;${k}_bright_bg=[10${v}m";done
fg() { printf "[38;2;$1;$2;$3m"; }
bg() { printf "[48;2;$1;$2;$3m"; }
underline_color() { printf "[58;2;$1;$2;$3m"; }
