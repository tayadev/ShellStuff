#!/bin/sh
r='[m';c='[36m';m='[35m';
d="$r ~ "

printf '%s\n' "\
$m$USER$r@$m$(cat /proc/sys/kernel/hostname)$r
${c}os$d$(grep "PRETTY_NAME" /etc/os-release | cut -d\" -f2)
${c}kr$d$(uname -r | cut -d '-' -f1)
${c}sh$d${SHELL##*/}
${c}wm$d$(xprop -id $(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}') -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")"