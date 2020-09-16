#!/bin/bash

## Take one argument [-1, 1] that determines the sign of the incremets.
## Than check if is the case of enable the lens and apply the incremented(or decremented) magnify factor.
## If the new magnify factor is less than 1, the magnify factor is set to 1.0 and the lens is disabled.

key="org.gnome.desktop.a11y.magnifier mag-factor"
key_lens="org.gnome.desktop.a11y.applications screen-magnifier-enabled"

log="true"

show_help () {
    echo "USAGE: $0 increment"
}
re='^[+-]?[0-9]+([.][0-9]+)?$'
if [ "$#" -eq 0 ] || [ $1 = "-h" ] || [ $1 = "--help" ]
then
    show_help
    exit
fi

if [[ ! $1  =~ $re ]] 
then
    echo "increment must be a number"
    exit
fi



lens_status=$(gsettings get $key_lens)
mag_factor=$(gsettings get $key)
increment=$1
mag_factor=$(echo "$mag_factor + $increment" | bc -l)

if [ $(echo "$mag_factor < 1.1" | bc -l) = "1" ]
    then
        if [ $log = "true" ]; then echo "lens disabled"; fi;

        if [ $lens_status = "true" ]
         then
            gsettings set $key_lens false
            gsettings set $key 1.0
        fi
    else
        if [ $log = "true" ]; then echo "lens enabled"; fi;
        
        if [ $lens_status = "false" ]
            then
            gsettings set $key_lens true
        fi
        gsettings set $key $mag_factor
        
fi
