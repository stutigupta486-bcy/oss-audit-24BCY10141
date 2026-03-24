#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author: Stuti Gupta | Reg: 24BCY10141
# Course: Open Source Software | VIT Bhopal University
# Chosen Software: LibreOffice
# =============================================================

# --- Student and project info ---
STUDENT_NAME="Stuti Gupta"
REG_NUMBER="24BCY10141"
SOFTWARE_CHOICE="LibreOffice"

# --- Gather live system information ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
ARCH=$(uname -m)
HOME_DIR=$HOME
CURRENT_DATE=$(date)

# Try lsb_release first, fall back to /etc/os-release
if command -v lsb_release &>/dev/null; then
    DISTRO=$(lsb_release -d | cut -f2-)
else
    DISTRO=$(grep PRETTY_NAME /etc/os-release 2>/dev/null | cut -d'"' -f2)
fi

# uptime -p is human readable; fallback for systems that don't support it
if uptime -p &>/dev/null 2>&1; then
    UPTIME=$(uptime -p)
else
    UPTIME=$(uptime | awk -F',' '{print $1}' | sed 's/.*up //')
fi

# --- Display the report ---
echo "=================================================="
echo "    Open Source Audit — System Identity Report"
echo "=================================================="
echo "  Student    : $STUDENT_NAME ($REG_NUMBER)"
echo "  Software   : $SOFTWARE_CHOICE"
echo "--------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Architecture : $ARCH"
echo "  Current User : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $CURRENT_DATE"
echo "--------------------------------------------------"
echo "  License Note:"
echo "  LibreOffice is distributed under the Mozilla"
echo "  Public License 2.0 (MPL 2.0) — free to use,"
echo "  study, modify, and share."
echo "=================================================="

echo ""
read -p "Press [Enter] to exit..."
