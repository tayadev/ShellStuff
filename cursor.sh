#!/bin/sh
# Move the cursor $1 up
cursor_up() { printf '[%dA' "$1" >&2; }
# Move the cursor $1 down
cursor_down() { printf '[%dB' "$1" >&2; }
# Move the cursor $1 right
cursor_right() { printf '[%dC' "$1" >&2; }
# Move the cursor $1 left
cursor_left() { printf '[%dD' "$1" >&2; }

# Move the cursor tothe start of the line $1 lines down
cursor_line_down() { printf '[%dE' "$1" >&2; }
# Move the cursor tothe start of the line $1 lines up
cursor_line_up()   { printf '[%dF' "$1" >&2; }

# Move the cursor to column $1
cursor_column()    { printf '[%dG' "$1" >&2; }
# Move the cursor to row $1 column $2
cursor_position()  { printf '[%d;%dH' "$1" "$2" >&2; }

# If $1 is 0 clear from cursor to the end of the screen, if $1 is 1 clear from cursor to the beginning of the screen, if $1 is 2 clear entire screen, if $1 is 3 clear entire string and delete scrollback buffer
erase_display()    { printf '[%dJ' "$1" >&2; }
# If $1 is 0 clear from cursor to the end of the line, if $1 is 1 clear from cursor to the begining of the line, if $1 is 2 clear entire line
erase_line()       { printf '[%dK' "$1" >&2; }

# Scroll $1 up
scroll_up()        { printf '[%dS' "$1" >&2; }
# Scroll $1 down
scroll_down()      { printf '[%dT' "$1" >&2; }

# Hides the cursor
cursor_hide()      { printf '[?25l' >&2; }
# Shows the cursor
cursor_show()      { printf '[?25h' >&2; }

# Saves the cursor position
cursor_save()      { printf '[s' >&2; }
# Restores the cursor position
cursor_load()      { printf '[u' >&2; }

cursor_get_position() {
    oldstty=$(stty -g)
    stty raw -echo min 0 time 1
    printf '[6n' >&2;
    IFS=';' read -r row col
    stty "$oldstty"
    printf '%d %d' "${row#*[}" "${col%R}"
}
cursor_get_row() { cursor_get_position | cut -d" " -f1; }
cursor_get_col() { cursor_get_position | cut -d" " -f2; }

terminal_get_size() { stty size; }
terminal_get_width() { terminal_get_size | cut -d" " -f1; }
terminal_get_height() { terminal_get_size | cut -d" " -f2; }