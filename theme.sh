#!/bin/sh

# $1 ANSI color code to set, $2 xparsecolor color to set it to
set_color() {
    printf ']4;%d;%s' "$1" "$2"
}