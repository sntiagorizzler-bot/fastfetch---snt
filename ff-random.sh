#!/usr/bin/env bash

LOGOS_DIR="$HOME/.config/fastfetch/logos"
CONFIG="$HOME/.config/fastfetch/config.jsonc"
TEMP_CONFIG="/tmp/fastfetch-random.jsonc"

PALETAS=(
    "5B6FD4 4D8EF5 6E97F4 BEDCF9"
    "7B5FA8 D94F82 A1A4AD F4F6F6"
    "950606 6B2030 708B86 DDE8E9"
    "8A8A8A A0A0A0 81807E D1D1D1"
    "7A7A80 8C8C92 7D7D83 B3B3B6"
    "7A7270 867B7A ABA7A7 D7D6D8"
    "5A6470 52565C 6F8494 D8E1E7"
    "6A7280 767E89 A0A8B1 F0F5F8"
    "3A5A8A 4B70A7 A3C2DB EEF5F7"
    "7A5A68 584A52 8E687A C2B8BE"
)

RAND=$(( RANDOM % ${#PALETAS[@]} ))
read -r C1 C2 C3 C4 <<< "${PALETAS[$RAND]}"
C1="#$C1"; C2="#$C2"; C3="#$C3"; C4="#$C4"

CHOSEN="$LOGOS_DIR/$((RAND + 1)).png"
ln -sf "$CHOSEN" "$LOGOS_DIR/current.png"

sed -e "s/%%C1%%/$C1/g" \
    -e "s/%%C2%%/$C2/g" \
    -e "s/%%C3%%/$C3/g" \
    -e "s/%%C4%%/$C4/g" \
    "$CONFIG" > "$TEMP_CONFIG"

fastfetch -c "$TEMP_CONFIG"
