#!/usr/bin/fish

# From https://wiki.archlinux.org/index.php/Fish#Start_X_at_login
# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
