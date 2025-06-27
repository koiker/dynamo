#!/bin/bash

function kill_tree() {
local parent=$1
    local children=$(ps -o pid= --ppid $parent)
for child in $children; do
kill_tree $child
done
echo "Killing process $parent"
kill -9 $parent
}

kill_tree $(pgrep circusd)

