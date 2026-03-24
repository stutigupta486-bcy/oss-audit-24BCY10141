#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author: Stuti Gupta | Reg: 24BCY10141
# Course: Open Source Software | VIT Bhopal University
# =============================================================

PACKAGE="libreoffice"

echo "=================================================="
echo "         FOSS Package Inspector"
echo "=================================================="
echo "  Checking package: $PACKAGE"
echo "--------------------------------------------------"

# Check if the package is installed
if dpkg -l "$PACKAGE" &>/dev/null || command -v soffice &>/dev/null; then
    echo "  STATUS: $PACKAGE is INSTALLED."
    echo ""

    # Try dpkg for detailed info (Debian/Ubuntu)
    if command -v dpkg &>/dev/null && dpkg -s "$PACKAGE" &>/dev/null; then
        VERSION=$(dpkg -s "$PACKAGE" | grep '^Version' | cut -d' ' -f2)
        DESCRIPTION=$(dpkg -s "$PACKAGE" | grep '^Description' | cut -d' ' -f2-)
        echo "  Version     : $VERSION"
        echo "  Description : $DESCRIPTION"
    elif command -v soffice &>/dev/null; then
        VERSION=$(soffice --version 2>/dev/null | head -n 1)
        echo "  Version     : $VERSION"
    fi
else
    echo "  STATUS: $PACKAGE is NOT installed."
    echo ""
    echo "  To install on Ubuntu/Debian:"
    echo "    sudo apt update && sudo apt install libreoffice"
    echo ""
    echo "  To install via Flatpak:"
    echo "    flatpak install flathub org.libreoffice.LibreOffice"
fi

echo ""
echo "--------------------------------------------------"

# Use a case statement for context-specific trivia
case $PACKAGE in
    libreoffice)
        echo "  About: LibreOffice is the community's answer"
        echo "  to Microsoft Office. Forked from OpenOffice.org"
        echo "  in 2010 after Oracle's acquisition of Sun, it is"
        echo "  now maintained by The Document Foundation under"
        echo "  the Mozilla Public License 2.0."
        ;;
    git)
        echo "  About: Git is the distributed version control"
        echo "  system written by Linus Torvalds in 2005."
        ;;
    firefox)
        echo "  About: Firefox is Mozilla's open source browser,"
        echo "  committed to privacy and a free, open web."
        ;;
    vlc)
        echo "  About: VLC plays almost any media format and"
        echo "  proves that open source can match any proprietary tool."
        ;;
    *)
        echo "  About: $PACKAGE is a valued tool in the FOSS ecosystem."
        ;;
esac

echo "=================================================="
echo ""
read -p "Press [Enter] to exit..."
