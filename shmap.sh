#!/bin/sh
__hash() { echo "$1" | md5sum -; }
map_create() { mktemp -d --suffix "-shmap"; }
map_get() { cat "$1/$(__hash "$2")"; }
map_put() { echo "$3" > "$1/$(__hash "$2")"; }
map_delete() { rm -f "$1/$(__hash "$2")"; }
map_destroy() { rm -r "$1"; }
map_has() { test -r "$1/$(__hash "$2")"; }