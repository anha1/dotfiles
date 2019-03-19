#!/bin/sh
# display the current i3 workspace number
i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2
