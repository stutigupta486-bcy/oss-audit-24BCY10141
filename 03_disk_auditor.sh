#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: Stuti Gupta | Reg: 24BCY10141
# Course: Open Source Software | VIT Bhopal University
# Audits key directories and LibreOffice config paths
# =============================================================

# Directories to audit — chosen because they're key Linux system paths
# and /usr/lib/libreoffice is where LibreOffice installs its core binaries
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/usr/lib/libreoffice")

echo "=================================================="
echo "        Directory & Permission Audit Report"
echo "=================================================="
echo ""

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group from ls -ld output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Get the directory's own size (errors suppressed for protected dirs)
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        if [ -z "$SIZE" ]; then SIZE="N/A (permission denied)"; fi

        # Get the overall filesystem disk usage percentage
        FS_USAGE=$(df -h "$DIR" 2>/dev/null | awk 'NR==2 {print $5}')

        echo "  Directory : $DIR"
        echo "  Perms     : $PERMS"
        echo "  Size      : $SIZE"
        echo "  Disk Used : $FS_USAGE"
        echo "--------------------------------------------------"
    else
        echo "  [SKIP] $DIR — does not exist on this system."
        echo "--------------------------------------------------"
    fi
done

# Specific check for LibreOffice user config directory
LO_CONFIG="$HOME/.config/libreoffice"
echo ""
echo "  LibreOffice User Config Check:"
if [ -d "$LO_CONFIG" ]; then
    LO_PERMS=$(ls -ld "$LO_CONFIG" | awk '{print $1, $3, $4}')
    LO_SIZE=$(du -sh "$LO_CONFIG" 2>/dev/null | cut -f1)
    echo "  Path   : $LO_CONFIG"
    echo "  Perms  : $LO_PERMS"
    echo "  Size   : $LO_SIZE"
    echo "  Status : EXISTS — user has a LibreOffice profile."
else
    echo "  Path   : $LO_CONFIG"
    echo "  Status : NOT FOUND — LibreOffice may not have been"
    echo "           launched yet, or is not installed."
fi

echo "=================================================="
echo ""
read -p "Press [Enter] to exit..."
