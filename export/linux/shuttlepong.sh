#!/bin/sh
echo -ne '\033c\033]0;Shuttlecock\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/shuttlepong.x86_64" "$@"
