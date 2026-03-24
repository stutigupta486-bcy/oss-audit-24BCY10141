#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author: Stuti Gupta | Reg: 24BCY10141
# Course: Open Source Software | VIT Bhopal University
#
# Usage: ./04_log_analyzer.sh <logfile> [keyword]
# Default keyword: error
# Example: ./04_log_analyzer.sh /var/log/syslog error
# =============================================================

LOGFILE=$1
KEYWORD=${2:-"error"}   # Default to "error" if no keyword is given
COUNT=0

echo "=================================================="
echo "           Log File Analyzer"
echo "=================================================="

# Check that a log file argument was actually provided
if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    echo "=================================================="
    read -p "Press [Enter] to exit..."
    exit 1
fi

# Check that the specified file exists
if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File not found — '$LOGFILE'"
    echo "  Please provide a valid log file path."
    echo "=================================================="
    read -p "Press [Enter] to exit..."
    exit 1
fi

# Handle edge case: the file exists but is currently empty
RETRY=0
while true; do
    if [ -s "$LOGFILE" ]; then
        break
    fi
    echo "  WARNING: File is empty. Retrying in 2 seconds... ($RETRY/3)"
    sleep 2
    RETRY=$((RETRY + 1))
    if [ $RETRY -ge 3 ]; then
        echo "  ERROR: File is still empty after 3 attempts. Exiting."
        read -p "Press [Enter] to exit..."
        exit 1
    fi
done

echo "  Log File : $LOGFILE"
echo "  Keyword  : \"$KEYWORD\" (case-insensitive)"
echo "--------------------------------------------------"

# Read the file line by line and count keyword occurrences
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo ""
echo "  Result: Keyword '$KEYWORD' found $COUNT time(s)."
echo ""

# If matches were found, show the last 5 for quick triage
if [ $COUNT -gt 0 ]; then
    echo "--------------------------------------------------"
    echo "  Last 5 Matching Lines:"
    echo "--------------------------------------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5 | while IFS= read -r MATCH; do
        echo "  > $MATCH"
    done
else
    echo "  No lines matched. The log looks clean for '$KEYWORD'."
fi

echo "=================================================="
echo ""
read -p "Press [Enter] to exit..."
