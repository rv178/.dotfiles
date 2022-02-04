#!/usr/bin/env bash

NOTIFY_ICON=/usr/share/icons/numigsur-icon-theme/32/apps/system-software-update.svg

get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates

    # notify user of updates
    if hash notify-send &>/dev/null; then
        if (( UPDATES > 50 )); then
            notify-send -a "Updates" -i $NOTIFY_ICON \
                "You really need to update!!" "$UPDATES New packages"
        elif (( UPDATES > 25 )); then
            notify-send -a "Updates" -i $NOTIFY_ICON \
                "You should update soon" "$UPDATES New packages"
        elif (( UPDATES > 2 )); then
            notify-send -a "Updates" -i $NOTIFY_ICON \
                "$UPDATES New packages"
        fi
    fi
done
