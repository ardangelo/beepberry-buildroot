#!/bin/sh

for socket in /tmp/tmux-*/default; do
	tmux -S $socket refresh-client -S
done

