#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: Stuti Gupta | Reg: 24BCY10141
# Course: Open Source Software | VIT Bhopal University
# =============================================================

echo "=================================================="
echo "     Open Source Manifesto Generator"
echo "=================================================="
echo ""
echo "  Answer three short questions to generate your"
echo "  personal open source manifesto."
echo ""
echo "--------------------------------------------------"

# Collect three pieces of personal input from the user
read -p "  1. Name one FOSS tool you use every day: " TOOL
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "  3. Name one thing you would build and share freely: " BUILD

echo "--------------------------------------------------"
echo ""

# Prepare date and output filename
DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# Write the manifesto to file using a grouped command block
# The { } groups all echoes so they share a single redirection
{
    echo "### My Open Source Manifesto ###"
    echo "Date   : $DATE"
    echo "Author : $(whoami)"
    echo ""
    echo "I believe in free and open source software because tools like"
    echo "$TOOL make my daily work more effective and more honest."
    echo ""
    echo "To me, true freedom means $FREEDOM — and that is exactly the"
    echo "spirit that drives the open source movement. Not just the"
    echo "freedom to use software, but to understand it, improve it,"
    echo "and share those improvements with everyone."
    echo ""
    echo "If I had the skills and the time, I would build $BUILD"
    echo "and share it with the world for free. Because everything I"
    echo "build will stand on the shoulders of those who shared before me."
    echo ""
    echo "Signed: $(whoami) | $DATE"
} > "$OUTPUT"

echo "  Manifesto saved to: $OUTPUT"
echo ""
echo "=================================================="
echo ""

# Display the generated manifesto
cat "$OUTPUT"

echo ""
echo "=================================================="
echo ""
read -p "Press [Enter] to exit..."
