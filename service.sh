#!/usr/bin/env sh
while [ "$(getprop sys.boot_completed)" != 1 ]; do sleep 5; done

replace_value_resetprop() { # Replace a substring in a property's value
    VALUE="$(resetprop -v "$1")"
    [ -z "$VALUE" ] && return
    VALUE_NEW="$(echo -n "$VALUE" | sed "s|${2}|${3}|g")"
    [ "$VALUE" == "$VALUE_NEW" ] || resetprop -v -n "$1" "$VALUE_NEW"
}

replace_value_resetprop ro.build.display.id "lineage_" ""
replace_value_resetprop ro.build.display.id "userdebug" "user"

echo "Exiting in 5 seconds..."
sleep 5